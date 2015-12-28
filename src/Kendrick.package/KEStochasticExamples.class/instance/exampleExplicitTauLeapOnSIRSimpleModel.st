examples
exampleExplicitTauLeapOnSIRSimpleModel
	"self new exampleExplicitTauLeapOnSIRSimpleModel"
	|model simulator  dB |
	model := KEModel new.
	model population attributes: '{#status: [#S, #I, #R]}'.
	model buildFromCompartments: '{
		{#status: #S}: 4975, {#status: #I}: 25, {#status: #R}: 0
	}'.
	model addParameters: {#beta->0.073. #gamma->36.5. #mu->0.01825. #N->#sizeOfPopulation}.

	model addTransitionFrom: '{#status: #S}' to: '{#status: #I}' probability: [ :m| (m atParameter: #beta)*(m probabilityOfContact:'{#status: #I}') ].	
	model addTransitionFrom: '{#status: #I}' to: '{#status: #R}' probability: [:m| (m atParameter: #gamma)].
	model addTransitionFrom: '{#status: #S}' to: #empty probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #I}' to: #empty probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #R}' to: #empty probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: #empty to: '{#status: #S}' probability: [:m| (m atParameter: #mu)].
	simulator := KESimulator new: #TauLeap from: 0 to: 0.4 step: 0.0027.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: simulator allTimeSeries.
	^ dB view
	
	