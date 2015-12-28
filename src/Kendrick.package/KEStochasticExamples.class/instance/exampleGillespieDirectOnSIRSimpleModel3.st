examples
exampleGillespieDirectOnSIRSimpleModel3
	"self new exampleGillespieDirectOnSIRSimpleModel3"
	|model  simulator dB |
	model := KEModel new.
	model population attributes: '{#status: [#S, #I, #R]}'.
	model buildFromCompartments: '{
		{ #status: #S }: 99,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameters: {#beta->0.01. #gamma->0.1}.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| (m atParameter: #beta) * (m probabilityOfContact: '{#status: #I}')].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (m atParameter: #gamma)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 200 step: 0.01.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: simulator allTimeSeries.
	^ dB view
	
	