examples
runIBMSimulatorOnSIRModel2
	"self new runIBMSimulatorOnSIRModel2"
	|model simulator output db |
	model := KEModel new.
	model population attributes: '{#status:[#S,#I,#R]}'.
	model buildFromCompartments: '{
		{#status:#S}:99, {#status:#I}:1, {#status:#R}:0
	}'.
	model addParameter: '{#beta: 0.01, #gamma: 0.1}'.
	model addTransition: (KETransition from: '{#status:#S}' to: '{#status:#I}' probability: [:m|(m atParameter: #beta)*(model atCompartment: '{#status:#I}')]).
	model addTransition: (KETransition from: '{#status:#I}' to: '{#status:#R}' probability: [:m|(m atParameter: #gamma)]).
	simulator := KESimulator new: #IBM from: 0.0 to: 200 step: 0.1.
	simulator executeOn:  model.
	output := simulator data.
	db := KEDiagramBuilder new data: (output dataAt: '{#status:#I}').
	db open
	
	