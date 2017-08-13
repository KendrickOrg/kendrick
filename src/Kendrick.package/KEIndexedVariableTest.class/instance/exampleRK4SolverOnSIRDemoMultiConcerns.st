as yet unclassified 
exampleRK4SolverOnSIRDemoMultiConcerns
	"self new exampleRK4SolverOnSIRDemoMultiConcerns"
	| model simulator |
	model := self modelSIRDemoMultiConcerns.
	model := self getIndexedEquations4Model: model.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.3 by: 0.0027.
	simulator executeOn: model.