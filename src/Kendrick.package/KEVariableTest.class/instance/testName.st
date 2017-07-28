tests
testName
	| g |
	g := KEVariable new.
	g symbol: #gamma.
	self assert: g symbol equals: #gamma