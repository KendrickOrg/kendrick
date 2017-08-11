as yet unclassified 
exampleRK4SolverSIRMultiHost
	"self new exampleRK4SolverSIRMultiHost"
	" 0.33282400621415886 => count > 100000"
	" a KEGillespieSimulator => count > 200000"
	" a KEGillespieSimulator => count > 150000"
	" 0.40997448604412007 => count > 120000"
	" a KEGillespieSimulator => count > 130000"
|model simulator db temp|
model := self modelSIRMultiHost.

"simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.5 by: 0.0027."
simulator := KESimulator new: #Gillespie from: 0.0 to: 0.5 by: 0.0027.
temp := simulator executeOn: model.
^temp.
"db := (KEDiagramBuilder new) data: ((simulator allTimesSeriesContaining: '{#status: #I}') sqrt).
db open"