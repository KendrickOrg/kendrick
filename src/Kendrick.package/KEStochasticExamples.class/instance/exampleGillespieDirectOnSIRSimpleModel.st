examples
exampleGillespieDirectOnSIRSimpleModel
	"self new exampleGillespieDirectOnSIRSimpleModel"
	|model simulator dB |
	model := KEModel new population: (KEPopulation size: 10000).
	model addAttribute: #status value: #(#S #I #R).
	model atCompartment: { #status->#S } put: 9999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->520. #gamma->52}.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I}) / (m atParameter: #N)].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (model atParameter: #gamma)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 1.0 step: 0.001.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: simulator timeSeries.
	^ dB open
	
	