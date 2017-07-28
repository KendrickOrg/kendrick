tests
testExpression
	self parse: '-beta * S * I' rule: #expression.
	self parse: 'beta * S * I - gamma * I' rule: #expression.
	