examples
exampleGillespieDirectOnSIRBioPEPAModel
	"self new exampleGillespieDirectOnSIRBioPEPAModel"
	|model  simulator output dB |
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 100,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameters: '{#beta: 1.4247, #gamma: 0.1429}'.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| (m atParameter: #beta) * (m atCompartment: '{#status: #I}')].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (m atParameter: #gamma)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 100 step: 1.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder new.
	dB data: (output dataAt: #all).
	dB open
	
	