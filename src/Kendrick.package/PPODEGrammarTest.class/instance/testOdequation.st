tests
testOdequation
	self
		parse: 'S:t = -beta * S * I' rule: #odequation;
		parse: ' S[i]:t = -beta * cos(i*j)' rule: #odequation