examples
exampleRK4SolverOnSIRSimpleModel
	"self new exampleRK4SolverOnSIRSimpleModel"
	|model simulator output dB|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameter: '{#beta: 0.0052, #gamma: 52}'.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| (m atParameter: #beta) * (m atCompartment: '{#status: #I}')].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| m atParameter: #gamma].
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 1.0 step: 0.001.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder new.
	dB data: (output dataAt: '{#status: #I}').
	dB open