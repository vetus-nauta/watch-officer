extends RefCounted

class_name HudSnapshotBinder

const CONTROLS_TEXT := "Controls: Space/Enter start | A/Left port | D/Right starboard | Q/Down speed down | E/Up speed up | R reset"
const CUE_LEGEND_TEXT := "Cues: cyan corridor | amber shallow | yellow finish gate | red/green Region A lateral pair | orange AIS vector"
const BRIEFING_DRAFT_TEXT := "Draft training scenario - not final maritime instruction."
const RESULT_DRAFT_TEXT := "Draft training scenario - captain note, not final maritime instruction."
const OPENING_CUE_HOLD_TICKS := 40

const TERMINAL_RESULT_STATES := ["success", "warning_outcome", "unsafe_manoeuvre", "near_miss", "grounding", "collision", "load_blocked"]
const SAFE_WATER_LABELS := {
	"in_corridor": "Safe corridor",
	"corridor_buffer": "Corridor caution",
	"shallow_buffer": "Shallow-water caution",
	"shallow": "Shallow water",
	"grounded": "Grounded"
}
const CPA_TCPA_LABELS := {
	"safe": "CPA safe",
	"caution": "CPA caution",
	"danger": "CPA danger",
	"immediate": "CPA immediate"
}
const WARNING_LABELS := {
	"warning.cpa_risk": "CPA risk",
	"warning.shallow_water": "Shallow water",
	"warning.leaving_safe_water": "Leaving safe water",
	"warning.late_alteration": "Late alteration",
	"warning.collision": "Collision",
	"warning.grounding": "Grounding",
	"cpa_tcpa.cpa_risk": "CPA risk",
	"geometry.shallow_water": "Shallow water",
	"geometry.leaving_safe_water": "Leaving safe water",
	"geometry.grounding": "Grounding",
	"result.collision": "Collision",
	"result.grounding": "Grounding"
}
const RESULT_CHIP_LABELS := {
	"success": "Acceptable watch",
	"warning_outcome": "Needs correction",
	"unsafe_manoeuvre": "Needs correction",
	"near_miss": "Needs correction",
	"grounding": "Unsafe watch",
	"collision": "Unsafe watch",
	"load_blocked": "Blocked"
}
const RESULT_REASON_LABELS := {
	"success": "Scenario completed without grounding or collision.",
	"warning_outcome": "Completed with active warnings.",
	"unsafe_manoeuvre": "Unsafe manoeuvre recorded.",
	"near_miss": "CPA risk became excessive.",
	"grounding": "Grounding recorded.",
	"collision": "Collision recorded.",
	"load_blocked": "Scenario load blocked."
}
const WARNING_REASON_LABELS := {
	"warning.cpa_risk": "CPA risk increased.",
	"warning.shallow_water": "Shallow-water risk increased.",
	"warning.leaving_safe_water": "Safe-water corridor was not maintained.",
	"warning.late_alteration": "Manoeuvre was late or unclear.",
	"cpa_tcpa.cpa_risk": "CPA risk increased.",
	"geometry.shallow_water": "Shallow-water risk increased.",
	"geometry.leaving_safe_water": "Safe-water corridor was not maintained."
}


func build_sections(runtime_snapshot: Dictionary, attempt_state: String = "ready", scenario_result_detail: Dictionary = {}) -> Dictionary:
	if runtime_snapshot.is_empty():
		return {
			"instrument_strip": "No runtime snapshot",
			"warning_stack": "Warnings\nPrimary: none",
			"result_status": "Result\nState: unavailable",
			"debug_status": "Draft / non-final training status unavailable",
			"attempt_status": "Attempt\nState: unavailable",
				"captain_report": "Captain note\nScenario result: unavailable\nTraining draft - needs review",
				"briefing": _build_briefing(),
				"result_feedback": "",
				"decision_coaching": "",
				"decision_coaching_primary": "",
				"decision_coaching_chips": [],
				"result_reasons": [],
				"cue_legend": CUE_LEGEND_TEXT,
				"controls": CONTROLS_TEXT,
				"combined": "No runtime snapshot"
		}

	var instrument_strip := _build_instrument_strip(runtime_snapshot, attempt_state)
	var warning_stack := _build_warning_stack(runtime_snapshot)
	var result_status := _build_result_status(runtime_snapshot, scenario_result_detail)
	var debug_status := _build_debug_status(runtime_snapshot)
	var attempt_status := _build_attempt_status(runtime_snapshot, attempt_state)
	var captain_report := _build_captain_report(runtime_snapshot, attempt_state, scenario_result_detail)
	var briefing := _build_briefing()
	var result_feedback := _build_result_feedback(runtime_snapshot, attempt_state, scenario_result_detail)
	var decision_coaching_model := _build_decision_coaching_model(runtime_snapshot, attempt_state)
	var decision_coaching := _format_decision_coaching(decision_coaching_model)
	var result_reasons := _result_reasons(runtime_snapshot, scenario_result_detail)
	return {
		"instrument_strip": instrument_strip,
		"warning_stack": warning_stack,
		"result_status": result_status,
		"debug_status": debug_status,
		"attempt_status": attempt_status,
		"captain_report": captain_report,
		"briefing": briefing,
		"result_feedback": result_feedback,
		"decision_coaching": decision_coaching,
		"decision_coaching_primary": decision_coaching_model["primary"],
		"decision_coaching_chips": decision_coaching_model["chips"].duplicate(true),
		"result_reasons": result_reasons.duplicate(true),
		"cue_legend": CUE_LEGEND_TEXT,
		"controls": CONTROLS_TEXT,
		"combined": "\n".join([
			instrument_strip,
			"",
			warning_stack,
			"",
			result_status,
			"",
			attempt_status,
			"",
			captain_report,
			"",
			briefing,
			"",
			result_feedback,
			"",
			decision_coaching,
			"",
			debug_status
		])
	}


func _build_briefing() -> String:
	return "\n".join([
		"Safe Water, Crossing Target",
		"",
		BRIEFING_DRAFT_TEXT,
		"",
		"Objective",
		"Proceed through the marked safe-water corridor. Avoid shallow water, grounding, collision, and unsafe CPA with the crossing target.",
		"",
		"Situation",
		"IALA Region A. One red/green lateral pair marks a simple channel. A power-driven target crosses ahead from starboard. VTS is disabled for this scenario.",
		"",
		"Watch",
		"Read the marks first. Keep the vessel in safe water. Use early, clear heading or speed changes if CPA becomes caution, danger, or immediate.",
		"",
		"Controls",
		"Turn port/starboard. Step speed down/up. Start when ready.",
		"",
		"Start Attempt"
	])


func _build_result_feedback(runtime_snapshot: Dictionary, attempt_state: String, scenario_result_detail: Dictionary) -> String:
	var scenario_result := str(runtime_snapshot["scenario_result"])
	if attempt_state != "completed" and not TERMINAL_RESULT_STATES.has(scenario_result):
		return ""

	var result_category := _result_category(scenario_result)
	var safe_water: Dictionary = runtime_snapshot["safe_water"]
	var cpa_tcpa: Dictionary = runtime_snapshot["cpa_tcpa"]
	var reasons := _result_reasons(runtime_snapshot, scenario_result_detail)
	var reason_lines: Array[String] = ["Reasons"]
	for reason in reasons:
		reason_lines.append("- %s" % reason)
	return "\n".join([
		result_category["title"],
		RESULT_DRAFT_TEXT,
		"",
		"Result: %s" % scenario_result,
		"",
		result_category["body"],
		"",
		"Safe water: %s" % _safe_water_player_label(str(safe_water["state"])),
		"CPA/TCPA: %s" % _cpa_tcpa_player_label(str(cpa_tcpa["state"])),
		"Warnings: %s" % _warning_summary(runtime_snapshot, scenario_result_detail),
		"",
		"\n".join(reason_lines),
		"",
		"Restart Attempt"
	])


func _result_category(scenario_result: String) -> Dictionary:
	if scenario_result == "success":
		return {
			"title": "Acceptable watch",
			"body": "You kept the vessel in the safe-water corridor and completed the crossing situation without grounding or collision."
		}
	if ["warning_outcome", "unsafe_manoeuvre", "near_miss"].has(scenario_result):
		return {
			"title": "Watch needs correction",
			"body": "The attempt remained recoverable, but the watch developed avoidable risk. Review the warning summary before restarting."
		}
	return {
		"title": "Unsafe watch",
		"body": "The attempt ended in an unsafe outcome. Restart and keep the vessel clear of shallow water and the crossing target."
	}


func _build_decision_coaching_model(runtime_snapshot: Dictionary, attempt_state: String) -> Dictionary:
	if attempt_state != "running":
		return {
			"primary": "",
			"chips": []
		}

	var scenario_result := str(runtime_snapshot["scenario_result"])
	var safe_water: Dictionary = runtime_snapshot["safe_water"]
	var cpa_tcpa: Dictionary = runtime_snapshot["cpa_tcpa"]
	var warnings: Dictionary = runtime_snapshot["warnings"]
	var primary_warning = warnings.get("primary_warning", null)
	var primary := ""
	var chips: Array[String] = []

	if TERMINAL_RESULT_STATES.has(scenario_result):
		primary = _terminal_result_cue(scenario_result)
		chips.append(str(RESULT_CHIP_LABELS.get(scenario_result, scenario_result)))
	elif primary_warning != null and str((primary_warning as Dictionary).get("severity", "")) == "immediate":
		var immediate_warning: Dictionary = primary_warning
		primary = _warning_cue(immediate_warning)
		chips.append(_warning_label_for_key(str(immediate_warning.get("text_key", immediate_warning.get("id", "")))))
	elif ["immediate", "danger"].has(str(cpa_tcpa["state"])):
		primary = _cpa_coaching_cue(str(cpa_tcpa["state"]))
		chips.append(_cpa_tcpa_player_label(str(cpa_tcpa["state"])))
	elif ["grounded", "shallow", "shallow_buffer"].has(str(safe_water["state"])):
		primary = _safe_water_coaching_cue(str(safe_water["state"]))
		chips.append(_safe_water_player_label(str(safe_water["state"])))
	elif primary_warning != null and ["danger", "caution"].has(str((primary_warning as Dictionary).get("severity", ""))):
		var active_warning: Dictionary = primary_warning
		primary = _warning_cue(active_warning)
		chips.append(_warning_label_for_key(str(active_warning.get("text_key", active_warning.get("id", "")))))
	elif str(cpa_tcpa["state"]) == "caution":
		primary = _cpa_coaching_cue("caution")
		chips.append(_cpa_tcpa_player_label("caution"))
	elif str(safe_water["state"]) == "corridor_buffer":
		primary = _safe_water_coaching_cue("corridor_buffer")
		chips.append(_safe_water_player_label("corridor_buffer"))
	elif bool(safe_water.get("finish_gate_crossed", false)):
		primary = "Finish crossed. Awaiting result."
		chips.append("Finish")
	elif int(runtime_snapshot["tick"]) <= OPENING_CUE_HOLD_TICKS:
		primary = "Read the lateral pair. Stay in the marked corridor."
		chips.append("IALA A")
	elif bool(runtime_snapshot["target"].get("visible", false)) and str(cpa_tcpa["state"]) == "safe":
		primary = "Monitor the crossing target."
		chips.append(_cpa_tcpa_player_label("safe"))
	else:
		primary = _safe_water_coaching_cue(str(safe_water["state"]))
		chips.append(_safe_water_player_label(str(safe_water["state"])))

	if runtime_snapshot.get("draft_training", false) and chips.size() < 2:
		chips.append("Draft training")

	return {
		"primary": primary,
		"chips": chips.slice(0, min(2, chips.size()))
	}


func _format_decision_coaching(model: Dictionary) -> String:
	var primary := str(model.get("primary", ""))
	if primary == "":
		return ""
	var chips: Array = model.get("chips", [])
	if chips.is_empty():
		return primary
	var chip_strings: Array[String] = []
	for chip in chips:
		chip_strings.append(str(chip))
	return "%s\n%s" % [primary, " | ".join(chip_strings)]


func _terminal_result_cue(scenario_result: String) -> String:
	match scenario_result:
		"success":
			return "Attempt complete. Review the captain note."
		"warning_outcome":
			return "Attempt complete with warnings. Review corrections."
		"unsafe_manoeuvre":
			return "Unsafe manoeuvre recorded. Review the warning summary."
		"near_miss":
			return "Near miss recorded. Review CPA risk."
		"grounding":
			return "Grounding recorded. Restart from ready state."
		"collision":
			return "Collision recorded. Restart from ready state."
		"load_blocked":
			return "Scenario load blocked. QA review required."
	return "Attempt complete. Review the captain note."


func _safe_water_coaching_cue(state: String) -> String:
	match state:
		"in_corridor":
			return "Hold the corridor."
		"corridor_buffer":
			return "Correct early. You are near the corridor edge."
		"shallow_buffer":
			return "Shallow water ahead. Turn back into safe water."
		"shallow":
			return "Unsafe water. Recover immediately."
	return "Hold the corridor."


func _cpa_coaching_cue(state: String) -> String:
	match state:
		"caution":
			return "CPA caution. Make your intention clear early."
		"danger":
			return "CPA danger. Increase separation now."
		"immediate":
			return "Immediate CPA risk. Avoid collision."
	return "Monitor the crossing target."


func _warning_cue(warning: Dictionary) -> String:
	match str(warning.get("text_key", warning.get("id", ""))):
		"warning.cpa_risk", "cpa_tcpa.cpa_risk":
			return _cpa_coaching_cue(str(warning.get("severity", "caution")))
		"warning.shallow_water", "geometry.shallow_water":
			if str(warning.get("severity", "")) == "immediate":
				return "Unsafe water. Recover immediately."
			return "Shallow water ahead. Turn back into safe water."
		"warning.leaving_safe_water", "geometry.leaving_safe_water":
			return "Correct early. You are near the corridor edge."
		"warning.collision":
			return "Collision recorded. Restart from ready state."
		"warning.grounding", "geometry.grounding":
			return "Grounding recorded. Restart from ready state."
	return _warning_label_for_key(str(warning.get("text_key", warning.get("id", ""))))


func _build_instrument_strip(runtime_snapshot: Dictionary, attempt_state: String) -> String:
	var scenario_static: Dictionary = runtime_snapshot.get("scenario_static", {})
	var ownship: Dictionary = runtime_snapshot["ownship"]
	return "\n".join([
		"Watch Officer greybox",
		"Attempt %s | Scenario %s" % [attempt_state, runtime_snapshot["scenario_result"]],
		"IALA %s | %s" % [scenario_static.get("iala_region", "A"), runtime_snapshot["camera"]["mode"]],
		"Tick %s | Time %.2fs" % [runtime_snapshot["tick"], float(runtime_snapshot["time_sec"])],
		"HDG %.1f deg | Speed %s" % [float(ownship["heading_deg"]), ownship["speed_level"]],
		"Turn %s | Safe water %s" % [ownship["turn_state"], runtime_snapshot["safe_water"]["state"]]
	])


func _build_warning_stack(runtime_snapshot: Dictionary) -> String:
	var warnings: Dictionary = runtime_snapshot["warnings"]
	var primary_warning: Variant = warnings["primary_warning"]
	var secondary_warnings: Array = warnings.get("secondary_warnings", [])
	var lines := ["Warnings"]
	lines.append("Primary: %s" % _format_warning(primary_warning))
	if secondary_warnings.is_empty():
		lines.append("Secondary: none")
	else:
		var secondary_text: Array[String] = []
		for warning in secondary_warnings:
			secondary_text.append(_format_warning(warning))
		lines.append("Secondary: %s" % " | ".join(secondary_text))
	return "\n".join(lines)


func _build_result_status(runtime_snapshot: Dictionary, scenario_result_detail: Dictionary) -> String:
	var cpa_tcpa: Dictionary = runtime_snapshot["cpa_tcpa"]
	var vts: Dictionary = runtime_snapshot["vts"]
	return "\n".join([
		"Result",
		"State: %s" % runtime_snapshot["scenario_result"],
		"Reason: %s" % scenario_result_detail.get("reason", "not_finished"),
		"CPA/TCPA: %s" % cpa_tcpa["state"],
		"VTS: %s/%s" % [str(vts["enabled"]), vts["state"]]
	])


func _build_debug_status(runtime_snapshot: Dictionary) -> String:
	var scenario_static: Dictionary = runtime_snapshot.get("scenario_static", {})
	var qa: Dictionary = runtime_snapshot["qa"]
	return "\n".join([
		"Draft / non-final training",
		"draft_training: %s" % str(runtime_snapshot["draft_training"]),
		"rule_review: %s" % scenario_static.get("rule_review_status", "draft"),
		"training_claim: %s" % scenario_static.get("training_claim_status", "draft_not_final_training_content"),
		"QA seed %s | %s Hz | +/- %s tick" % [
			qa["seed"],
			qa["fixed_tick_hz"],
			qa["event_timing_tolerance_ticks"]
		]
	])


func _build_attempt_status(runtime_snapshot: Dictionary, attempt_state: String) -> String:
	return "\n".join([
		"Attempt",
		"State: %s" % attempt_state,
		"Engine scenario_state: %s" % runtime_snapshot["scenario_state"],
		"Reset/restart returns to deterministic tick 0"
	])


func _build_captain_report(runtime_snapshot: Dictionary, attempt_state: String, scenario_result_detail: Dictionary) -> String:
	var active_warning_ids: Array = scenario_result_detail.get("active_warning_ids", [])
	var warning_text := "none"
	if not active_warning_ids.is_empty():
		var warning_strings: Array[String] = []
		for warning_id in active_warning_ids:
			warning_strings.append(str(warning_id))
		warning_text = ", ".join(warning_strings)

	var safe_water: Dictionary = runtime_snapshot["safe_water"]
	var cpa_tcpa: Dictionary = runtime_snapshot["cpa_tcpa"]
	return "\n".join([
		"Captain note",
		"Attempt state: %s" % attempt_state,
		"Scenario result: %s" % runtime_snapshot["scenario_result"],
		"Active warnings: %s" % warning_text,
		"Safe water: %s | CPA/TCPA: %s" % [safe_water["state"], cpa_tcpa["state"]],
		"Training draft - needs review"
	])


func _format_warning(warning: Variant) -> String:
	if warning == null:
		return "none"
	var warning_dict: Dictionary = warning
	return "%s / %s" % [warning_dict.get("text_key", ""), warning_dict.get("severity", "")]


func _warning_summary(runtime_snapshot: Dictionary, scenario_result_detail: Dictionary) -> String:
	var warning_labels: Array[String] = []
	var warnings: Dictionary = runtime_snapshot["warnings"]
	_append_warning_label(warning_labels, warnings.get("primary_warning", null))
	for warning in warnings.get("secondary_warnings", []):
		_append_warning_label(warning_labels, warning)

	if warning_labels.size() < 3:
		for warning_id in scenario_result_detail.get("active_warning_ids", []):
			var label := _warning_label_for_key(str(warning_id))
			if not warning_labels.has(label):
				warning_labels.append(label)
			if warning_labels.size() >= 3:
				break

	if warning_labels.is_empty():
		return "none"
	return ", ".join(warning_labels.slice(0, min(3, warning_labels.size())))


func _result_reasons(runtime_snapshot: Dictionary, scenario_result_detail: Dictionary) -> Array[String]:
	var scenario_result := str(runtime_snapshot["scenario_result"])
	var reasons: Array[String] = []
	if TERMINAL_RESULT_STATES.has(scenario_result):
		reasons.append(str(RESULT_REASON_LABELS.get(scenario_result, "Scenario result recorded.")))

	var warnings: Dictionary = runtime_snapshot["warnings"]
	_append_reason_for_warning(reasons, warnings.get("primary_warning", null))
	for warning in warnings.get("secondary_warnings", []):
		_append_reason_for_warning(reasons, warning)

	if reasons.size() < 3:
		for warning_id in scenario_result_detail.get("active_warning_ids", []):
			var reason := _reason_for_warning_key(str(warning_id))
			if reason != "" and not reasons.has(reason):
				reasons.append(reason)
			if reasons.size() >= 3:
				break

	if reasons.is_empty() and scenario_result == "success":
		reasons.append(str(RESULT_REASON_LABELS["success"]))
		reasons.append("CPA recovered or safe.")
	elif reasons.is_empty():
		reasons.append("Scenario result recorded.")

	return reasons.slice(0, min(3, reasons.size()))


func _append_reason_for_warning(reasons: Array[String], warning: Variant) -> void:
	if warning == null or reasons.size() >= 3:
		return
	var warning_dict: Dictionary = warning
	var reason := _reason_for_warning_key(str(warning_dict.get("text_key", warning_dict.get("id", ""))))
	if reason != "" and not reasons.has(reason):
		reasons.append(reason)


func _reason_for_warning_key(key: String) -> String:
	return str(WARNING_REASON_LABELS.get(key, ""))


func _append_warning_label(warning_labels: Array[String], warning: Variant) -> void:
	if warning == null or warning_labels.size() >= 3:
		return
	var warning_dict: Dictionary = warning
	var label := _warning_label_for_key(str(warning_dict.get("text_key", warning_dict.get("id", ""))))
	if not warning_labels.has(label):
		warning_labels.append(label)


func _warning_label_for_key(key: String) -> String:
	return str(WARNING_LABELS.get(key, key))


func _safe_water_player_label(state: String) -> String:
	return str(SAFE_WATER_LABELS.get(state, state))


func _cpa_tcpa_player_label(state: String) -> String:
	return str(CPA_TCPA_LABELS.get(state, state))
