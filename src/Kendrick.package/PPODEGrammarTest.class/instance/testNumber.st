tests
testNumber
	self
		parse: '0' rule: #number;
		parse: '0.0' rule: #number;
		parse: '1.2' rule: #number;
		parse: '34' rule: #number;
		parse: '56.78' rule: #number;
		parse: '-9' rule: #number;
		parse: '-9.9' rule: #number;
		fail: '3..3' rule: #number