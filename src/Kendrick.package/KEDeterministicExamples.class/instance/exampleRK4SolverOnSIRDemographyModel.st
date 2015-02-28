examples
exampleRK4SolverOnSIRDemographyModel
	"self new exampleRK4SolverOnSIRDemographyModel"
	|model simulator output dB|
	model := KEModel new.
	model population attributes: '{#status: [#S, #I, #R]}'.
	model addCompartment: '{#status: #S}' initialValue: 4975.
	model addCompartment: '{#status: #I}' initialValue: 25.
	model addCompartment: '{#status: #R}' initialValue: 0.
	model addParameter: #beta value: 1/5000.
	model addParameter: #gamma value: 1/10.0.
	model addParameter: #mu value: 5e-4.  
	model addParameter: #N value: 5000.
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	model addEquation: 'I:t=beta*S*I-gamma*I-mu*I' parseAsAnEquation.
	model addEquation: 'R:t=gamma*I-mu*R' parseAsAnEquation.
	simulator := KESimulator new: #Gillespie from: 0.0 to: 146 step: 0.1.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder new.
	dB data: (output dataAt: #all).
	dB open