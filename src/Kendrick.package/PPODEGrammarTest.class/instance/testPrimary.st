tests
testPrimary
	self
		parse: '(0)' rule: #primary;
		parse: 'toto' rule: #primary;
		parse: '(xxx)' rule: #primary;
		parse: '1' rule: #primary;
		parse: '1.2' rule: #primary;
		parse: '((34))' rule: #primary