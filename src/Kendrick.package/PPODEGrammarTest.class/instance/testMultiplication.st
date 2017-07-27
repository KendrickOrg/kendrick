tests
testMultiplication
	self
		parse: '3*4' rule: #multiplication;
		parse: '3*a' rule: #multiplication;
		parse: 'gamma*I' rule: #multiplication;
		parse: 'gamma*beta*gamma' rule: #multiplication;
		parse: '-beta*S*I' rule: #multiplication;
		parse: 'a/b' rule: #multiplication