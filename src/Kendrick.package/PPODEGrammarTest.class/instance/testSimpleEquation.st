tests
testSimpleEquation
	self
		parse: 'S = -beta * S * I' rule: #simpleEquation;
		parse: ' beta[i][j] = -beta * cos(i*j)' rule: #simpleEquation