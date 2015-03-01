examples
exampleRK4SolverOnSIRMultiHostModel
	"self new exampleRK4SolverOnSIRMultiHostModel"
	|model simulator output db|
	model := KEModel new.
	model population attributes: '{
		#status: [ #S, #I, #R ], #species: [ #mosquito, #reservoir1, #reservoir2 ]
	}'.
	model buildFromCompartments: '{
		{ #status: #S, #species: #mosquito }: 9800,
		{ #status: #I, #species: #mosquito }: 200,
		{ #status: #R, #species: #mosquito }: 0,
		{ #status: #S, #species: #reservoir1 }: 1000,
		{ #status: #I, #species: #reservoir1 }: 0,
		{ #status: #R, #species: #reservoir1 }: 0,
		{ #status: #S, #species: #reservoir2 }: 2000,
		{ #status: #I, #species: #reservoir2 }: 0,
		{ #status: #R, #species: #reservoir2 }: 0
	}'.
	model addParameters: '{{#species: #mosquito}:{
		#beta: { { #species: #reservoir1 }: 0.02, { #species: #reservoir2 }: 0.02, #yourself: 0.0 },
		#mu: 12.17
		}
	}'.
	model addParameters: '{{#species: #reservoir1}:{
		#beta: { { #species: #reservoir2 }: 0.0, { #species: #mosquito }: 0.02, #yourself: 0.0 },
		#mu: 0.05
		}
	}'.
	model addParameters: '{{#species: #reservoir2}:{
		#beta: { { #species: #reservoir1 }: 0.0, { #species: #mosquito }: 0.02, #yourself: 0.0 },
		#mu: 0.05
		}
	}'.
	model addParameter: #gamma value: 52.
	model addParameter: #N value: #sizeOfPopulation.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [:m|(m atParameter: #beta)*(m atCompartment: '{#status: #I}')].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [:m| m atParameter: #gamma].
	model addTransitionFrom: '{#status: #S}'
		to: #empty
		probability: [:m| m atParameter: #mu].
	model addTransitionFrom: '{#status: #I}'
		to: #empty
		probability: [:m| m atParameter: #mu].
	model addTransitionFrom: '{#status: #R}'
		to: #empty
		probability: [:m| m atParameter: #mu].
	model addTransitionFrom: #empty
		to: '{#status: #S}'
		probability: [:m| (m atParameter: #mu)].
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.5 step: 0.0027.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	db open
	