tests
testIdentifier
	self
		parse: 'beta' rule: #identifier;
		parse: 'gamma' rule: #identifier;
		parse: 'a1' rule: #identifier;
		fail: '11b' rule: #identifier