as yet unclassified
testKEVariableNode
	| tmp1 tmp2 tmp3 tmp5 |
	tmp3 := KECPPVisitor new.
	tmp5 := KECompartment new.
	tmp5
		status: #S;
		initialValue: #(1).
	tmp3 visitNode: (tmp5 numberOfSpecies: 1).
	tmp1 := KEVariable symbol: #S.
	tmp2 := tmp3 visitNode: tmp1.
	self assert: tmp2 = 'x(0, 0)'