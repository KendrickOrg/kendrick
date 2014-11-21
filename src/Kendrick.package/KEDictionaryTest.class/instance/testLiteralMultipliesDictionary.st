as yet unclassified
testLiteralMultipliesDictionary
	|a|
	a := KEDictionary new.
	a at: #a put: 1; at: #b put: 2.
	
	self assert: (a * 2) isDictionary equals: true.
	self assert: (2 * a) values sum equals: 6 