examples
exampleRK4SolverOnSIRDemographyModel
	"self new exampleRK4SolverOnSIRDemographyModel"
	|model simulator dB|
	model := self modelRK4SolverOnSIRDemography.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 146 step: 0.1.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: (simulator dataAt: #all).
	^ dB view