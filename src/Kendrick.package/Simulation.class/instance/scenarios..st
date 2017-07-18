public-api
scenarios: aScenarioIDArray
	
	scenarios := aScenarioIDArray collect: [ :sId | Scenario withId: sId ].
	combo := scenarios last composition.