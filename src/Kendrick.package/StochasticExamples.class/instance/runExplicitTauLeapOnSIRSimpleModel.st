tests
runExplicitTauLeapOnSIRSimpleModel
	"self new runExplicitTauLeapOnSIRSimpleModel"
	|model simulator|
	model := self createSIRSimpleModel2.	
	simulator := KESimulatorBuilder new.
	simulator run: #ExplicitTauLeap tMin: 0 tMax: 730 step: 1 model: model. 
	simulator plot: #(#S #I #R).
	
	