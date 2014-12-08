examples
runIBMSimulatorOnSEIRMeaslesModel
	"self new runIBMSimulatorOnSEIRMeaslesModel"
	|model simulator output diag |
	model := KEModel new.
	model population attributes: '{#status: [#S, #E, #I, #R]}'.
	model buildFromCompartments: '{
		{#status: #S}: 99999,
		{#status: #I}: 1,
		{#status: #E}: 0,
		{#status: #R}:0
	}'.
	model addParameter: '{#beta: 0.0000214, #gamma: 0.143, #mu: 0.0000351, #sigma: 0.125, #N: 100000}'.
	model addTransition: (KETransition
		from: '{#status: #S}'
		to: '{#status: #E}'
		probability: [:m| (m atParameter: #beta) * (m atCompartment: '{#status:#I}')]).
	model addTransition: (KETransition
		from: '{#status: #E}'
		to: '{#status: #I}'
		probability: [:m| (m atParameter: #sigma)]).
	model addTransition: (KETransition
		from: '{#status: #I}'
		to: '{#status: #R}'
		probability: [:m| (m atParameter: #gamma)]).
	model addTransition: (KETransition
		from: '{#status: #S}'
		to: #empty
		probability: [:m| (m atParameter: #mu)]).
	model addTransition: (KETransition
		from: '{#status: #I}'
		to: #empty
		probability: [:m| (m atParameter: #mu)]).
	model addTransition: (KETransition
		from: '{#status: #R}'
		to: #empty
		probability: [:m| (m atParameter: #mu)]).
	model addTransition: (KETransition
		from: '{#status: #E}'
		to: #empty
		probability: [:m| (m atParameter: #mu)]).
	model addTransition: (KETransition
		from: #empty
		to: '{#status: #S}'
		probability: [:m| (m atParameter: #mu)]).
	simulator := KESimulator new: #IBM from: 0.0 to: 200 step: 1.
	simulator executeOn: model.
	output := simulator data.
	diag := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}').
	diag open
	
	