examples
exampleRK4SolverOn2SEIRMeaslesModelWithVaccination
	"self new exampleRK4SolverOn2SEIRMeaslesModelWithVaccination"
	|model simulator output diag data legends|
	model := KEModel new.
	model population attributes: '{#status: [#S, #E, #I, #R]}'.
	model buildFromCompartments: '{
		{#status: #S}: 99999,
		{#status: #I}: 1,
		{#status: #E}: 0,
		{#status: #R}: 0
	}'.
	model addParameters: '{#beta: 0.00782, #gamma: 52.14, #mu: 0.0128, #sigma: 45.625, #N: #sizeOfPopulation, #p: 0.7}'.
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
		probability: [:m| (m atParameter: #mu) * (1 - (m atParameter: #p))].
	model addTransitionFrom: #empty
		to: '{#status: #R}'
		probability: [:m| (m atParameter: #mu) * (m atParameter: #p)].
	data := OrderedCollection new.
	legends := OrderedCollection new.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 100 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	data addAll: (output dataAt: '{#status: #I}').
	
	model addParameter: #p value: 0.0.
	model resetCompartments.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 100 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	data addAll: (output dataAt: '{#status: #I}').
	 
	legends addAll: #('p = 0.7' 'p = 0.0').
	diag := (KEDiagramBuilder new) data: data do: #log.
	diag legends: legends.
	diag xLabel: 'Time (years)'.
	diag yLabel: 'log(Infectious)'.
	diag legendTitle: 'Vaccination Rate'.
	^ diag view
	
	