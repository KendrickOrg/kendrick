examples
exampleGillespieDirectOnSEIRMeaslesModel
	"self new exampleGillespieDirectOnSEIRMeaslesModel"
	|model simulator  diag |
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: {#status->#(#S #E #I #R)}.
	model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.	
	model addParameters: {#beta->0.00782. #gamma->52.14. #mu->0.0128. #sigma->45.625}.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #E}'
		probability: [:m| 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I})].
	model addTransitionFrom: '{#status: #E}'
		to: '{#status: #I}'
		probability: [:m| (m atParameter: #sigma)].
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: [:m| (m atParameter: #gamma)].
	model addTransitionFrom: '{#status: #S}'
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #I}'
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #R}'
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: '{#status: #E}'
		to: #empty
		probability: [:m| (m atParameter: #mu)].
	model addTransitionFrom: #empty
		to: '{#status: #S}'
		probability: [:m| (m atParameter: #mu)].
	simulator := KESimulator new: #Gillespie from: 0.0 to: 0.5 step: 0.0027.
	simulator executeOn: model.
	diag := (KEDiagramBuilder new) data: (simulator allTimesSeriesContaining: '{#status: #I}').
	^ diag open
	
	
	