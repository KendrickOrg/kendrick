examples
runRK4SolverOnSIRMultiHostModelWithODERepresentation
	"self new runRK4SolverOnSIRMultiHostModelWithODERepresentation"
	|model simulator output db|
	model := KEModel new.
	model oldVersion: false.
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
	model addParameter: '{#v: 52}'.
	
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	model addEquation: ('I:t=beta*S*I-(mu+v)*I' parseAsAnEquation).
	model addEquation: ('R:t=v*I-mu*R' parseAsAnEquation).

	simulator := KESimulator new: #RungeKutta from: 0.0 to: 40.0 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder2 new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	db open
	