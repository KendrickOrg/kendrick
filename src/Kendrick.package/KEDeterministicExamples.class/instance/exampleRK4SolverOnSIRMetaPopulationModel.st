examples
exampleRK4SolverOnSIRMetaPopulationModel
	"self new exampleRK4SolverOnSIRMetaPopulationModel"
	|model simulator  output db|
	model := self modelRK4SolverOnSIRMetaPopulation.
	
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 40.0 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	^ db view