tests
testParenthesis
	self
		parse: '(0)' rule: #parenthesis;
		parse: '(1)' rule: #parenthesis;
		parse: '(a)' rule: #parenthesis;
		parse: '(a+b)' rule: #parenthesis;
		parse: '((a))' rule: #parenthesis;
		fail: ')a(' rule: #parenthesis