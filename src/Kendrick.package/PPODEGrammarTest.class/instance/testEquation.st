tests
testEquation
	self
		parse: 'S:t = -beta * S * I' rule: #equation;
		parse: ' S:t = -beta * S * I' rule: #equation;
		parse: 'I:t = beta * S * I - gamma * I' rule: #equation;
		parse: 'R:t = gamma * I' rule: #equation