examples
exampleRK4SolverOnSIRSimpleModelWithODERepresentation
	"self new exampleRK4SolverOnSIRSimpleModelWithODERepresentation"
	|model simulator output dB |
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameters: '{#beta: 0.0052, #gamma: 52}'.
	model addEquation: 'S:t=-beta*S*I' parseAsAnEquation.
	model addEquation: 'I:t=beta*S*I - gamma*I' parseAsAnEquation.
	model addEquation: 'R:t=gamma*I' parseAsAnEquation.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 1.0 step: 0.001.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder new.
	dB data: (output dataAt: '{#status: #I}').
	dB open