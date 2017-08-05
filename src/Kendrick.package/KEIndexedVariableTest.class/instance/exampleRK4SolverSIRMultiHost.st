as yet unclassified 
exampleRK4SolverSIRMultiHost
	"self new exampleRK4SolverSIRMultiHost"
|model simulator db|
model := self modelSIRMultiHost.

simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.5 by: 0.0027.
simulator executeOn: model.
db := (KEDiagramBuilder new) data: ((simulator allTimesSeriesContaining: '{#status: #I}') sqrt).
db open