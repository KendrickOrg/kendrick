examples
exampleExplicitTauLeapOnSIRSimpleModel
	"self new exampleExplicitTauLeapOnSIRSimpleModel"
	|model simulator output dB |
	model := KEModel new.
	model population attributes: '{#status: [#S, #I, #R]}'.
	model buildFromCompartments: '{
		{#status: #S}: 4975, {#status: #I}: 25, {#status: #R}: 0
	}'.
	model addParameters: '{#beta: 0.0002, #gamma: 0.1, #mu: 5e-4, #N: 5000}'.

	model addTransitionFrom: '{#status: #S}' to: '{#status: #I}' probability: [ :m| (m atParameter: #beta)*(m atCompartment:'{#status: #I}') ].	
	model addTransitionFrom: '{#status: #I}' to: '{#status: #R}' probability: [:m| (m atParameter: #gamma)].
	model addTransitionFrom: '{#status: #S}' to: #empty probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #I}' to: #empty probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #R}' to: #empty probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: #empty to: '{#status: #S}' probability: [:m| (m atParameter: #mu) * (m atParameter: #N)].
	simulator := KESimulator new: #TauLeap from: 0 to: 730 step: 1.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder new.
	dB data: (output dataAt: #all).
	dB open.
	
	