tests
testUnary
	self
		parse: '-beta' rule: #unary;
		parse: '-(beta * 5)' rule: #unary