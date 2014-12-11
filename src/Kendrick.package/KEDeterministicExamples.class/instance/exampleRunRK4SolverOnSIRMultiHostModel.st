examples
exampleRunRK4SolverOnSIRMultiHostModel
	"self new exampleRunRK4SolverOnSIRMultiHostModel"
	|model simulator output db|
	model := KEModel new.
	model population attributes: '{
		#status: [ #S, #I, #R ], #species: [ #mosquito, #reservoir1, #reservoir2 ]
	}'.
	model buildFromCompartments: '{
		{ #status: #S, #species: #mosquito }: 9999,
		{ #status: #I, #species: #mosquito }: 1,
		{ #status: #R, #species: #mosquito }: 0,
		{ #status: #S, #species: #reservoir1 }: 999,
		{ #status: #I, #species: #reservoir1 }: 1,
		{ #status: #R, #species: #reservoir1 }: 0,
		{ #status: #S, #species: #reservoir2 }: 1999,
		{ #status: #I, #species: #reservoir2 }: 1,
		{ #status: #R, #species: #reservoir2 }: 0
	}'.
	model addParameter: '{{#species: #mosquito}:{
		#beta: { { #species: #reservoir1 }: 0.02, { #species: #reservoir2 }: 0.02, #yourself: 0.0 },
		#mu: 12.17,
		#N: 10000
		}
	}'.
	model addParameter: '{{#species: #reservoir1}:{
		#beta: { { #species: #reservoir2 }: 0.0, { #species: #mosquito }: 0.02, #yourself: 0.0 },
		#mu: 0.05,
		#N: 1000
		}
	}'.
	model addParameter: '{{#species: #reservoir2}:{
		#beta: { { #species: #reservoir1 }: 0.0, { #species: #mosquito }: 0.02, #yourself: 0.0 },
		#mu: 0.05,
		#N: 2000
		}
	}'.
	model addParameter: '{#gamma: 52}'.
	model addTransition: (KETransition
		from: '{#status: #S}'
		to: '{#status: #I}'
		probability: [:m|(m atParameter: #beta)*(m atCompartment: '{#status: #I}')]).
	model addTransition: (KETransition
		from: '{#status: #I}'
		to: '{#status: #R}'
		probability: [:m| m atParameter: #gamma]).
	model addTransition: (KETransition
		from: '{#status: #S}'
		to: #empty
		probability: [:m| m atParameter: #mu]).
	model addTransition: (KETransition
		from: '{#status: #I}'
		to: #empty
		probability: [:m| m atParameter: #mu]).
	model addTransition: (KETransition
		from: '{#status: #R}'
		to: #empty
		probability: [:m| m atParameter: #mu]).
	model addTransition: (KETransition
		from: #empty
		to: '{#status: #S}'
		probability: [:m| (m atParameter: #mu)*(m atParameter: #N)]).
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 40.0 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	db open
	