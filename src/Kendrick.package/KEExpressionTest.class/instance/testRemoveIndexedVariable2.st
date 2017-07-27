tests
testRemoveIndexedVariable2
	| tmp1 tmp2 |
	tmp1 := KEIndexedVariable new symbol: #S.
	tmp1
		addIndex: (KEVariable new symbol: #i);
		addIndex: (KEVariable new symbol: #j).
	tmp2 := tmp1 removeIndexedVariable.
	self
		assert: tmp2 isAnIndexedVariable equals: false;
		assert: tmp2 symbol equals: #S