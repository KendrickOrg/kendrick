examples
exampleRK4SolverOnSIRMultiHostModelTransitionByRate
	"self new exampleRK4SolverOnSIRMultiHostModelTransitionByRate"
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
		rate: 'beta*I' parseAsAnExpression.
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		rate: 'gamma' parseAsAnExpression.
	model addTransitionFrom: '{#status: #S}'
		to: #empty
		rate: 'mu' parseAsAnExpression.
	model addTransitionFrom: '{#status: #I}'
		to: #empty
		rate: 'mu' parseAsAnExpression.
	model addTransitionFrom: '{#status: #R}'
		to: #empty
		rate: 'mu' parseAsAnExpression.
	model addTransitionFrom: #empty
		to: '{#status: #S}'
		rate: 'mu' parseAsAnExpression.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 40.0 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	db open
	