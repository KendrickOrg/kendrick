examples
exampleGillespieGPUOnSIRSimpleModel
	"self new exampleGillespieGPUOnSIRSimpleModel"
	|model simulator dB |
	model := KEModel new.
	model population attributes: '{#status: [#S, #I, #R]}'.
	model buildFromCompartments: '{
		{ #status: #S }: 999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameters: '{#beta: 520, #gamma: 52}'.
	model configurations: { #rescale->false }.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| (m atParameter: #beta) * (m probabilityOfContact: '{#status: #I}')].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (model atParameter: #gamma)].
	simulator := KESimulator new: #GPUGillespie from: 0.0 to: 1.0 step: 0.01.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: simulator allTimeSeries.
	^ dB view
	
	