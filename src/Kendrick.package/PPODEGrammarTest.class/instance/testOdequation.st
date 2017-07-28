tests
testOdequation
	self parse: 'S:t = -beta * S * I' rule: #odequation.
	self parse: ' S[i]:t = -beta * cos(i*j)' rule: #odequation.
	