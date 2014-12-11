examples
exampleRunRK4SolverOnSIRMultiHostModelWithODERepresentation
	"self new exampleRunRK4SolverOnSIRMultiHostModelWithODERepresentation"
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
	model addParameter: '{#v: 52}'.
	
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	model addEquation: ('I:t=beta*S*I-(mu+v)*I' parseAsAnEquation).
	model addEquation: ('R:t=v*I-mu*R' parseAsAnEquation).

	simulator := KESimulator new: #RungeKutta from: 0.0 to: 40.0 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	db open
	