examples
exampleGillespieDirectOnSEIRMeaslesModel
	"self new exampleGillespieDirectOnSEIRMeaslesModel"
	|model simulator output diag |
	model := KEModel new.
	model population attributes: '{#status: [#S, #E, #I, #R]}'.
	model buildFromCompartments: '{
		{#status: #S}: 99999,
		{#status: #I}: 1,
		{#status: #E}: 0,
		{#status: #R}:0
	}'.
	model addParameters: '{#beta: 0.0000214, #gamma: 0.143, #mu: 0.0000351, #sigma: 0.125, #N: 100000}'.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #E}'
		probability: [:fr :to :t| (model atParameter: #beta) * (model atCompartment: '{#status:#I}') * fr].
	model addTransitionFrom: '{#status: #E}'
		to: '{#status: #I}'
		probability: [:fr :to :t| (model atParameter: #sigma) * fr].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [:fr :to :t| (model atParameter: #gamma) * fr].
	model addTransitionFrom: '{#status: #S}'
		to: #empty
		probability: [:fr :to :t| (model atParameter: #mu) * fr].
	model addTransitionFrom: '{#status: #I}'
		to: #empty
		probability: [:fr :to :t| (model atParameter: #mu) * fr].
	model addTransitionFrom: '{#status: #R}'
		to: #empty
		probability: [:fr :to :t| (model atParameter: #mu) * fr].
	model addTransitionFrom: #empty
		to: '{#status: #S}'
		probability: [:fr :to :t| (model atParameter: #mu) * (model atParameter: #N)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 100 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	diag := (KEDiagramBuilder new) data: (output dataAt: #all).
	diag open
	
	
	