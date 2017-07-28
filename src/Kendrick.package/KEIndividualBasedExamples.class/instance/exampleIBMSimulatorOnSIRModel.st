examples
exampleIBMSimulatorOnSIRModel
	"self new exampleIBMSimulatorOnSIRModel"
	|model simulator dB|
	model := KEModel new population: (KEPopulation size: 10000).
	model addAttribute: #status value: #(#S #I #R).
	model atCompartment: { #status->#S } put: 9990 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 10.
	model addParameters: {#beta->0.0052. #gamma->52}.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I})].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (m atParameter: #gamma) ].
	simulator := KESimulator new: #IBM from: 0.0 to: 1.0 by: 0.0027.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: (simulator allTimesSeriesContaining: '{#status: #I}').
	dB open