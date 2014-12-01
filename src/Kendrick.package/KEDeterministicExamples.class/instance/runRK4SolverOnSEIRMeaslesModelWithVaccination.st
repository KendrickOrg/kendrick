examples
runRK4SolverOnSEIRMeaslesModelWithVaccination
	"self new runRK4SolverOnSEIRMeaslesModelWithVaccination"
	|model simulator output diag |
	model := KEModel new.
	model oldVersion: false.
	model population attributes: '{#status: [#S, #E, #I, #R]}'.
	model buildFromCompartments: '{
		{#status: #S}: 99999,
		{#status: #I}: 1,
		{#status: #E}: 0,
		{#status: #R}: 0
	}'.
	model addParameter: '{#beta: 0.00782, #gamma: 52.14, #mu: 0.0128, #sigma: 45.625, #N: 100000, #p: 0.7}'.
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
		probability: [:m| (m atParameter: #mu) * (m atParameter: #N) * (1 - (m atParameter: #p))]).
	model addTransition: (KETransition
		from: #empty
		to: '{#status: #R}'
		probability: [:m| (m atParameter: #mu) * (m atParameter: #N) * (m atParameter: #p)]).
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 100 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	diag := (KEDiagramBuilder2 new) data: (output dataAt: '{#status: #I}') do: #log.
	diag open
	