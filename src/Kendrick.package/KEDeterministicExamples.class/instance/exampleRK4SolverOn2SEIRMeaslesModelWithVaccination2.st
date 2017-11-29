examples
exampleRK4SolverOn2SEIRMeaslesModelWithVaccination2
	"example that use the new KEDiagramBuilder2 interface"
	"self new exampleRK4SolverOn2SEIRMeaslesModelWithVaccination2"
	| model simulator diag |
	model := self modelRK4SolverOnSEIRMeaslesModelWithVaccination.
	
	model atParameter: #p assignValue: 0.7.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 100 by: 0.01.
	simulator executeOn: model.
	diag := KEDiagramBuilder2 new.
	diag addTimeSeries: ((simulator timeSeriesAt: '{#status: #I}' ) log) withKey: '{#status: #I} p = 0.7'.
	
	model resetCompartments.
	model atParameter: #p assignValue: 0.0.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 100 by: 0.01.
	simulator executeOn: model.
	diag addTimeSeries: ((simulator timeSeriesAt: '{#status: #I}' ) log) withKey: '{#status: #I} p = 0.0'.
	 
	diag xLabel: 'Time (years)'.
	diag yLabel: 'log(Infectious)'.
	diag legendTitle: 'Vaccination Rate'.
	diag open2