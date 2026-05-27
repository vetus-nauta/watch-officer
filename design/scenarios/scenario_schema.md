# Scenario Schema Draft

Status: Draft

Each scenario should define the following fields before implementation:

```json
{
  "id": "scenario_id",
  "title": "Scenario Title",
  "status": "draft",
  "environment": "open_sea",
  "timeMode": "day",
  "weather": "calm",
  "playerVessel": {
    "type": "motor_yacht",
    "startPosition": { "x": 0, "y": 0 },
    "headingDeg": 0,
    "speedLevel": 0
  },
  "navigationElements": [],
  "trafficTargets": [],
  "communicationEvents": [],
  "objectives": [],
  "checkpoints": [],
  "failStates": [],
  "evaluationCriteria": []
}
```

Educational rule fields must include source notes or `requiresVerification: true`.
