tests
testAddition
	self
		parse: '3+4' rule: #addition;
		parse: '3 + 4' rule: #addition;
		parse: 'a+b' rule: #addition;
		parse: 'gamma+beta+gamma' rule: #addition;
		parse: 'beta*S*I-gamma*I' rule: #addition;
		parse: '-(beta+7)' rule: #addition;
		parse: 'a-b' rule: #addition