tests
testName
	| tmp1 |
	tmp1 := KEVariable new.
	tmp1 symbol: #gamma.
	self assert: tmp1 symbol equals: #gamma