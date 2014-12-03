examples
runExplicitTauLeapOnSIRSimpleModel
	"self new runExplicitTauLeapOnSIRSimpleModel"
	|model simulator output dB |
	model := KEModel new.
	model population attributes: '{#status: [#S, #I, #R]}'.
	model buildFromCompartments: '{
		{#status: #S}: 4975, {#status: #I}: 25, {#status: #R}: 0
	}'.
	model addParameter: '{#beta: 0.0002, #gamma: 0.1, #mu: 5e-4, #N: 5000}'.

	model addTransition: (KETransition from: '{#status: #S}' to: '{#status: #I}' probability: [ :m| (m atParameter: #beta)*(m atCompartment:'{#status: #I}') ]).	
	model addTransition: (KETransition from: '{#status: #I}' to: '{#status: #R}' probability: [:m| (m atParameter: #gamma)]).
	model addTransition: (KETransition from: '{#status: #S}' to: #empty probability: [:m| (m atParameter: #mu)]).
	model addTransition: (KETransition from: '{#status: #I}' to: #empty probability: [:m| (m atParameter: #mu)]).
	model addTransition: (KETransition from: '{#status: #R}' to: #empty probability: [:m| (m atParameter: #mu)]).
	model addTransition: (KETransition from: #empty to: '{#status: #S}' probability: [:m| (m atParameter: #mu) * (m atParameter: #N)]).
	simulator := KESimulator new: #TauLeap from: 0 to: 730 step: 1.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder new.
	dB data: (output dataAt: #all).
	dB open.
	
	