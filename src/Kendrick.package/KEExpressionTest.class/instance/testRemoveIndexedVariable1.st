tests
testRemoveIndexedVariable1
	| tmp1 tmp2 |
	tmp1 := KEVariable new symbol: #S.
	tmp2 := tmp1 removeIndexedVariable.
	self assert: tmp2 isAVariable equals: true