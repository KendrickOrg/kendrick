tests
testParenthesis
	self parse: '(0)' rule: #parenthesis.
	self parse: '(1)' rule: #parenthesis.
	self parse: '(a)' rule: #parenthesis.
	self parse: '(a+b)' rule: #parenthesis.
	self parse: '((a))' rule: #parenthesis.
	self fail: ')a(' rule: #parenthesis