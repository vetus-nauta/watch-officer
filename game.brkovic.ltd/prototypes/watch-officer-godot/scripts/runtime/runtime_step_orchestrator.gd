extends RefCounted

class_name RuntimeStepOrchestrator

const OwnshipKinematicIntegrator = preload("res://scripts/sim/ownship_kinematic_integrator.gd")
const TargetKinematicIntegrator = preload("res://scripts/sim/target_kinematic_integrator.gd")
const RangeBearingUpdater = preload("res://scripts/sim/range_bearing_updater.gd")
const ScenarioOneEncounterClassifier = preload("res://scripts/sim/scenario_one_encounter_classifier.gd")
const CpaTcpaDebugSolver = preload("res://scripts/sim/cpa_tcpa_debug_solver.gd")
const SafeWaterGeometryMonitor = preload("res://scripts/sim/safe_water_geometry_monitor.gd")
const WarningEscalationPipeline = preload("res://scripts/sim/warning_escalation_pipeline.gd")
const ScenarioResultEvaluator = preload("res://scripts/sim/scenario_result_evaluator.gd")
const RuntimeSnapshotExporter = preload("res://scripts/runtime/runtime_snapshot_exporter.gd")

const UPDATE_ORDER := [
	"apply_tick_inputs",
	"ownship_kinematic_integrator",
	"target_kinematic_integrator",
	"range_bearing_relative_side_updater",
	"scenario_one_encounter_classifier",
	"cpa_tcpa_numeric_debug_solver",
	"safe_water_geometry_monitor",
	"warning_escalation_pipeline",
	"scenario_result_evaluator",
	"runtime_snapshot_exporter"
]


func step(scenario: Dictionary, runtime_state: Dictionary, input_records: Array = [], external_flags: Dictionary = {}) -> Dictionary:
	var scenario_data: Dictionary = scenario.duplicate(true)
	var next_state: Dictionary = runtime_state.duplicate(true)
	var inputs: Array = input_records.duplicate(true)
	var flags: Dictionary = external_flags.duplicate(true)

	var root: Dictionary = next_state["root"]
	var next_tick: int = int(root["tick"]) + 1
	var fixed_tick_hz: int = int(root["fixed_tick_hz"])
	var delta_sec: float = 1.0 / float(fixed_tick_hz)
	var next_time_sec: float = float(next_tick) / float(fixed_tick_hz)
	var tick_inputs: Array = _inputs_for_tick(inputs, next_tick)

	var ownship_integrator := OwnshipKinematicIntegrator.new()
	var target_integrator := TargetKinematicIntegrator.new()
	var range_bearing_updater := RangeBearingUpdater.new()
	var encounter_classifier := ScenarioOneEncounterClassifier.new()
	var cpa_solver := CpaTcpaDebugSolver.new()
	var safe_water_monitor := SafeWaterGeometryMonitor.new()
	var warning_pipeline := WarningEscalationPipeline.new()
	var result_evaluator := ScenarioResultEvaluator.new()
	var snapshot_exporter := RuntimeSnapshotExporter.new()

	next_state["ownship"] = ownship_integrator.step(next_state["ownship"], scenario_data["ownship"], tick_inputs, delta_sec)
	next_state["target"] = target_integrator.step(next_state["target"], delta_sec)
	next_state["target"] = range_bearing_updater.update_target_geometry(next_state["ownship"], next_state["target"])
	next_state["encounter"] = encounter_classifier.classify(scenario_data, next_state["target"])
	next_state["cpa_tcpa"] = cpa_solver.solve(scenario_data, next_state["ownship"], next_state["target"], next_state["cpa_tcpa"])
	next_state["safe_water"] = safe_water_monitor.evaluate(scenario_data, next_state["ownship"], next_state["safe_water"])
	next_state["warnings"] = warning_pipeline.build_queue(next_state["safe_water"], next_state["cpa_tcpa"], next_state["ownship"], next_state["target"], next_tick, next_state["warnings"])

	var previous_result: Variant = next_state.get("scenario_result_detail", next_state["root"]["scenario_result"])
	if previous_result is String and previous_result == "ready":
		previous_result = "running"
	var result: Dictionary = result_evaluator.evaluate(next_state["safe_water"], next_state["cpa_tcpa"], next_state["warnings"], flags, previous_result, next_tick)

	next_state["scenario_result_detail"] = result.duplicate(true)
	next_state["root"]["tick"] = next_tick
	next_state["root"]["time_sec"] = next_time_sec
	next_state["root"]["scenario_state"] = "complete" if _is_terminal_result(result["state"]) else "running"
	next_state["root"]["scenario_result"] = result["state"]

	var snapshot: Dictionary = snapshot_exporter.export_snapshot(next_state)

	return {
		"runtime_state": next_state,
		"runtime_snapshot": snapshot,
		"scenario_result": result,
		"applied_input_records": tick_inputs,
		"update_order": UPDATE_ORDER.duplicate(true)
	}


func _inputs_for_tick(input_records: Array, tick: int) -> Array:
	var selected: Array = []
	for record in input_records:
		if int(record.get("tick", -1)) == tick:
			selected.append(record.duplicate(true))
	return selected


func _is_terminal_result(state: String) -> bool:
	return ["success", "warning_outcome", "near_miss", "grounding", "collision"].has(state)
