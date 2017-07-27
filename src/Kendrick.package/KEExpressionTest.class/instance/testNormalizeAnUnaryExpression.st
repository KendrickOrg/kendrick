tests
testNormalizeAnUnaryExpression
	| tmp1 |
	tmp1 := 's=-(-A*(B+C))' parseAsAnEquation.
	self
		assert: true equals: tmp1 expression isUnaryExpression;
		assert: false equals: tmp1 expression normalize isUnaryExpression