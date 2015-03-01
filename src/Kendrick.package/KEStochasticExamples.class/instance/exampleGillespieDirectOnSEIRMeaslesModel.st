examples
exampleGillespieDirectOnSEIRMeaslesModel
	"self new exampleGillespieDirectOnSEIRMeaslesModel"
	|model simulator output diag |
	model := KEModel new.
	model population attributes: '{#status: [#S, #E, #I, #R]}'.
	model buildFromCompartments: '{
		{#status: #S}: 99975,
		{#status: #I}: 25,
		{#status: #E}: 0,
		{#status: #R}:0
	}'.
	"model addParameters: '{#beta: 0.0000214, #gamma: 0.143, #mu: 0.0000351, #sigma: 0.125, #N: 100000}'."
	model addParameters: '{#beta: 0.00782, #gamma: 52.14, #mu: 0.0128, #sigma: 45.625, #N: #sizeOfPopulation}'.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #E}'
		probability: [:m| (m atParameter: #beta) * (m atCompartment: '{#status:#I}')].
	model addTransitionFrom: '{#status: #E}'
		to: '{#status: #I}'
		probability: [:m| (m atParameter: #sigma)].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [:m| (m atParameter: #gamma)].
	model addTransitionFrom: '{#status: #S}'
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #I}'
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #R}'
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #E}'
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: #empty
		to: '{#status: #S}'
		probability: [:m| (m atParameter: #mu)].
	simulator := KESimulator new: #IBM from: 0.0 to: 0.3 step: 0.0027.
	simulator executeOn: model.
	output := simulator data.
	diag := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}').
	diag open
	
	
	