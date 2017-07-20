examples
exampleGillespieDirectOnSIRBioPEPAModel
	"self new exampleGillespieDirectOnSIRBioPEPAModel"
	|model  simulator  dB |
	model := KEModel new population: (KEPopulation size: 100).
	model addAttribute: #status value: #(S I R).
	model atCompartment: { #status->#S } put: 99 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->1.4247. #gamma->0.1429}.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I})].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [ :m| (m atParameter: #gamma)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 100 step: 1.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: (simulator allTimesSeriesContaining: '{#status: #I}').
	^ dB view
	
	