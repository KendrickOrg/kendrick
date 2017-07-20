examples
exampleRK4SolverOn2SEIRMeaslesModelWithVaccination
	"self new exampleRK4SolverOn2SEIRMeaslesModelWithVaccination"
	|model simulator diag data legends|
	model := self modelRK4SolverOnSEIRMeaslesModelWithVaccination.
	data := OrderedCollection new.
	legends := OrderedCollection new.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 100 step: 0.01.
	simulator executeOn: model.
	data addAll: (simulator allTimesSeriesContaining: '{#status: #I}').
	
	model atParameter: #p assignValue: 0.0.
	model resetCompartments.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 100 step: 0.01.
	simulator executeOn: model.
	data addAll: (simulator allTimesSeriesContaining: '{#status: #I}').
	legends addAll: #('p = 0.7' 'p = 0.0').
	diag := (KEDiagramBuilder new) data: data log.
	diag legends: legends.
	diag xLabel: 'Time (years)'.
	diag yLabel: 'log(Infectious)'.
	diag legendTitle: 'Vaccination Rate'.
	^ diag open
	
	