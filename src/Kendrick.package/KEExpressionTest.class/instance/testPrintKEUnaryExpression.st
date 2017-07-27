tests
testPrintKEUnaryExpression
	| tmp1 tmp2 |
	tmp1 := KEVariable symbol: #beta.
	tmp2 := KEUnaryExpression op: #-.
	tmp2 expression: tmp1.
	self assert: '-beta' equals: tmp2 asString