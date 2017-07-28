tests
testPrimary
	self parse: '(0)' rule: #primary.
	self parse: 'toto' rule: #primary.
	self parse: '(xxx)' rule: #primary.
	self parse: '1' rule: #primary.
	self parse: '1.2' rule: #primary.
	self parse: '((34))' rule: #primary