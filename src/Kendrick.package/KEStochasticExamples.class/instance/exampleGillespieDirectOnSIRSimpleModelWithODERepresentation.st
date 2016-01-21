examples
exampleGillespieDirectOnSIRSimpleModelWithODERepresentation
	"self new exampleGillespieDirectOnSIRSimpleModelWithODERepresentation"
	|model  simulator dB |
	model := KEModel new population: (KEPopulation size: 100000).
	model addAttribute: #status value: #(#S #I #R).
	model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->0.0052. #gamma->52}.
	model addEquation: 'S:t=-beta*S*I'.
	model addEquation: 'I:t=beta*S*I - gamma*I'.
	model addEquation: 'R:t=gamma*I'.
	simulator := KESimulator new: #Gillespie from: 0.0 to: 1.0 step: 0.001.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: simulator allTimeSeries.
	^ dB view
	
	