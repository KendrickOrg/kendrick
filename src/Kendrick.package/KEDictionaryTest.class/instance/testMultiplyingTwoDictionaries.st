as yet unclassified
testMultiplyingTwoDictionaries
	|a b|
	a := KEDictionary new.
	a at: #a put: 1; at: #b put: 2.
	b := KEDictionary new.
	b at: #a put: 1; at: #b put: 3.
	self assert: (a * b) isDictionary equals: true.
	self assert: (a * b) values sum equals: 7 