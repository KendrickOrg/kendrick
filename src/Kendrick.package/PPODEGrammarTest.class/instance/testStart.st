tests
testStart
	self
		parse: 'S:t = -beta * S * I' rule: #start;
		parse: ' S:t = -beta * S * I' rule: #start;
		parse: 'I:t = beta * S * I - gamma * I' rule: #start;
		parse: 'R:t = gamma * I' rule: #start