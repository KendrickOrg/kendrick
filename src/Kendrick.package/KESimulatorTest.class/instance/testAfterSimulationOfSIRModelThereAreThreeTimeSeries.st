as yet unclassified
testAfterSimulationOfSIRModelThereAreThreeTimeSeries

|model simulator   |
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: {#status->#(#S #I #R)}.
	model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
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
	self assert: simulator allTimeSeries size = 3.