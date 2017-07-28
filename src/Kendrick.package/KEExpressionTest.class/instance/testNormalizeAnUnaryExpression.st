tests
testNormalizeAnUnaryExpression
	| expr |
	
	expr := 's=-(-A*(B+C))' parseAsAnEquation.
	self assert: true equals: expr expression isUnaryExpression.
	self assert: false equals: expr expression normalize isUnaryExpression.
	