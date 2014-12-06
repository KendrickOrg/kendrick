examples
runIBMSimulatorOnSIRModel
	"self new runIBMSimulatorOnSIRModel"
	|model  simulator output dB |
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
		probability: [ :m| (m atParameter: #beta) * (m atCompartment: '{#status: #I}') ]
	).
	model addTransition: (KETransition
		from: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (m atParameter: #gamma) ]
	).
	simulator := KESimulator new: #IBM from: 0.0 to: 1.0 step: 0.0027.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder new.
	dB data: (output dataAt: '{#status: #I}').
	dB open
	