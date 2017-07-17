tests
testEvaluateWithModel3
	"self new testEvaluateWithModel3"
	|model expr|
	"model := self initialize4TestEvaluateWithModel3."
	"expr := 'S[1]*gamma[3][1]' parseAsAnExpression."
	
	model := self prepare4FirstTestCase.
	
	expr := 'S[1][2]*3' parseAsAnExpression.
	self assert: (expr evaluateWithModel: model) equals: 1500.