examples
exampleIBMSimulatorOnSIRModel2
	"self new exampleIBMSimulatorOnSIRModel2"
	|model simulator db |
	model := KEModel new.
	model population attributes: '{#status:[#S,#I,#R]}'.
	model buildFromCompartments: '{
		{#status:#S}:99, {#status:#I}:1, {#status:#R}:0
	}'.
	model addParameters: '{#beta: 0.01, #gamma: 0.1}'.
	model forceOfInfection: #lambda formula: [:m|(m atParameter: #beta) * (m probabilityOfContact: {#status->#I}) ].
	model addTransitionFrom: '{#status:#S}' to: '{#status:#I}' probability: [:m|m evaluateForceOfInfection: #lambda].
	model addTransitionFrom: '{#status:#I}' to: '{#status:#R}' probability: [:m|(m atParameter: #gamma)].
	simulator := KESimulator new: #IBM from: 0.0 to: 200 step: 0.1.
	simulator executeOn:  model.
	db := KEDiagramBuilder new data: (simulator timeSeriesAt: '{#status:#I}').
	^ db view
	
	