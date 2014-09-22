tests
testParserAnExpression
	|beta|
	"dsdt := self parserClass parse: 'S:t=-beta*S*I'."
	beta := 'exp(-d^2)' parseAsAnExpression.
	self assert: beta isExpressionWithMathFunction equals: true.
	self assert: (beta functionName) equals: #exp.
	self assert: (beta functionExpr) isBinaryExpression equals: true