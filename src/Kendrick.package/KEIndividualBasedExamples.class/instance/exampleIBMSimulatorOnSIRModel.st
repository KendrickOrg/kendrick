examples
exampleIBMSimulatorOnSIRModel
	"self new exampleIBMSimulatorOnSIRModel"
	|model simulator dB|
	model := KEModel new.
	model population attributes: '{#status:[#S,#I,#R]}'.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameters: '{#beta: 0.0052, #gamma: 52}'.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| (m atParameter: #beta) * (m probabilityOfContact: '{#status: #I}')].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (m atParameter: #gamma) ].
	simulator := KESimulator new: #IBM from: 0.0 to: 1.0 step: 0.0027.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: (simulator timeSeriesAt: '{#status: #I}').
	^ dB view
	