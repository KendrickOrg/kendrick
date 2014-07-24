tests
runExplicitTauLeapOnSIRSimpleModel
	"self new runExplicitTauLeapOnSIRSimpleModel"
	|model|
	model := self createSIRSimpleModel2.	
	model run: 'stochastic' from: 0 to: 730 step: 1 algorithm: #ExplicitTauLeap.
	model plot: #(#S #I #R).
	
	