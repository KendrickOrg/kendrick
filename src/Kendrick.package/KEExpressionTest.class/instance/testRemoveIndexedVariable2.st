tests
testRemoveIndexedVariable2
	|e n|
	e := (KEIndexedVariable new symbol: #S).
	e addIndex: (KEVariable new symbol: #i).
	e addIndex: (KEVariable new symbol: #j).
	n := e removeIndexedVariable.
	self assert: n isAnIndexedVariable equals: false.
	self assert: n symbol equals: #S.
	