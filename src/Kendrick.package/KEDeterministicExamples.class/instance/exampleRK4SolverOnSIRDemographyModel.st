examples
exampleRK4SolverOnSIRDemographyModel
	"self new exampleRK4SolverOnSIRDemographyModel"
	|model simulator output dB|
	model := self modelRK4SolverOnSIRDemography.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 146 step: 0.1.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder new.
	dB data: (output dataAt: #all).
	^ dB view