tests
testRemoveIndexedVariable1
	|e n|
	e := (KEVariable new symbol: #S).
	n := e removeIndexedVariable.
	self assert: n isAVariable equals: true.
	