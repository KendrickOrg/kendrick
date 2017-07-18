examples
exampleExplicitTauLeapOnSIRSimpleModel
	"self new exampleExplicitTauLeapOnSIRSimpleModel"
	|model simulator  dB |
	model := KEModel new population: (KEPopulation size: 5000).
	model attributes: {#status->#(#S #I #R)}.
	model atCompartment: { #status->#S } put: 4975 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 25.
	model addParameters: {#beta->0.073. #gamma->36.5. #mu->0.01825}.

	model addTransitionFrom: '{#status: #S}' 
			to: '{#status: #I}' 
			probability: [ :aModel| 
				(aModel atParameter: #beta) *
				(aModel atCompartment: {#status->#I}) ].	
	model addTransitionFrom: '{#status: #I}' 
			to: '{#status: #R}' 
			probability: [:aModel| (aModel atParameter: #gamma)].
	model addTransitionFrom: '{#status: #S}' 
			to: #empty 
			probability: [:aModel| (aModel atParameter: #mu)].
	model addTransitionFrom: '{#status: #I}' 
			to: #empty 
			probability: [:aModel| (aModel atParameter: #mu)].
	model addTransitionFrom: '{#status: #R}' 
			to: #empty 
			probability: [:aModel| (aModel atParameter: #mu)].
	model addTransitionFrom: #empty 
	 		to: '{#status: #S}' 
			probability: [:aModel| (aModel atParameter: #mu)].
	simulator := KESimulator new: #TauLeap from: 0 to: 0.4 step: 0.0027.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: simulator allTimeSeries.
	^ dB open
	
	