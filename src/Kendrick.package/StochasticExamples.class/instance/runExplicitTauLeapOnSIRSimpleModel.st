tests
runExplicitTauLeapOnSIRSimpleModel
	"self new runExplicitTauLeapOnSIRSimpleModel"
	|model|
	model := self createSIRSimpleModel2.	
	model run: #ExplicitTauLeap from: 0 to: 730 step: 1.
	model plot: #(#S #I #R).
	
	