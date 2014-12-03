examples
runRK4SolverOnSIRMultiHostModelTransitionByRate
	"self new runRK4SolverOnSIRMultiHostModelTransitionByRate"
	|model simulator output db|
	model := KEModel new.
	model population attributes: '{
		#status: [ #S, #I, #R ], #specie: [ #mosquito, #reservoir1, #reservoir2 ]
	}'.
	model buildFromCompartments: '{
		{ #status: #S, #specie: #mosquito }: 9999,
		{ #status: #I, #specie: #mosquito }: 1,
		{ #status: #R, #specie: #mosquito }: 0,
		{ #status: #S, #specie: #reservoir1 }: 999,
		{ #status: #I, #specie: #reservoir1 }: 1,
		{ #status: #R, #specie: #reservoir1 }: 0,
		{ #status: #S, #specie: #reservoir2 }: 1999,
		{ #status: #I, #specie: #reservoir2 }: 1,
		{ #status: #R, #specie: #reservoir2 }: 0
	}'.
	model addParameter: '{{#specie: #mosquito}:{
		#beta: { { #specie: #reservoir1 }: 0.02, { #specie: #reservoir2 }: 0.02, #yourself: 0.0 },
		#mu: 12.17,
		#N: 10000
		}
	}'.
	model addParameter: '{{#specie: #reservoir1}:{
		#beta: { { #specie: #reservoir2 }: 0.0, { #specie: #mosquito }: 0.02, #yourself: 0.0 },
		#mu: 0.05,
		#N: 1000
		}
	}'.
	model addParameter: '{{#specie: #reservoir2}:{
		#beta: { { #specie: #reservoir1 }: 0.0, { #specie: #mosquito }: 0.02, #yourself: 0.0 },
		#mu: 0.05,
		#N: 2000
		}
	}'.
	model addParameter: '{#gamma: 52}'.
	model addTransition: (KETransition
		from: '{#status: #S}'
		to: '{#status: #I}'
		rate: 'beta*I' parseAsAnExpression).
	model addTransition: (KETransition
		from: '{#status: #I}'
		to: '{#status: #R}'
		rate: 'gamma' parseAsAnExpression).
	model addTransition: (KETransition
		from: '{#status: #S}'
		to: #empty
		rate: 'mu' parseAsAnExpression).
	model addTransition: (KETransition
		from: '{#status: #I}'
		to: #empty
		rate: 'mu' parseAsAnExpression).
	model addTransition: (KETransition
		from: '{#status: #R}'
		to: #empty
		rate: 'mu' parseAsAnExpression).
	model addTransition: (KETransition
		from: #empty
		to: '{#status: #S}'
		rate: 'mu*N' parseAsAnExpression).
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 40.0 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	db open
	