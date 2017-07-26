examples
exampleIBMSimulatorOnSIRModel2
	"self new exampleIBMSimulatorOnSIRModel2"
	|model simulator db |
	model := KEModel new population: (KEPopulation size: 100).
	model addAttribute: #status value: #(#S #I #R).
	model atCompartment: { #status->#S } put: 99 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->0.01. #gamma->0.1}.
	model addTransitionFrom: '{#status:#S}' 
			to: '{#status:#I}' 
			probability: [:aModel|
				(aModel atParameter: #beta) *
				(aModel atCompartment: {#status->#I})
			].
	model addTransitionFrom: '{#status:#I}' 
			to: '{#status:#R}' 
			probability: [:m|(m atParameter: #gamma)].
	simulator := KESimulator new: #IBM from: 0.0 to: 50 step: 0.1.
	simulator executeOn:  model.
	db := KEDiagramBuilder new data: (simulator timeSeriesOutputsAt: '{#status:#I}').
	^ db open
	
	