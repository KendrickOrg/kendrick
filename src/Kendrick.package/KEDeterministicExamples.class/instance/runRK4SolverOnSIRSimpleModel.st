examples
runRK4SolverOnSIRSimpleModel
	"self new runRK4SolverOnSIRSimpleModel"
	|model|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameter: '{#beta: 0.0052, #gamma: 52}'.
	model addTransition: (KETransition
		from: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :fr :to :t| (model atParameter: #beta) * fr * to ]
	).
	model addTransition: (KETransition
		from: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :fr :to :t| (model atParameter: #gamma) * fr ]
	).

	