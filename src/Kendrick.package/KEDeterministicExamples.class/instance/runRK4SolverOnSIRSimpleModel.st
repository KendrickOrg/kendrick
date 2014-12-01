examples
runRK4SolverOnSIRSimpleModel
	"self new runRK4SolverOnSIRSimpleModel"
	|model  simulator output dB |
	model := KEModel new.
	model oldVersion: false.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameter: '{#beta: 0.0052, #gamma: 52}'.
	model addTransition: (KETransition
		from: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| (m atParameter: #beta) * (m atCompartment: '{#status: #I}') ]
	).
	model addTransition: (KETransition
		from: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (m atParameter: #gamma) ]
	).
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 1.0 step: 0.001.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder2 new.
	dB data: (output dataAt: '{#status: #I}').
	dB open