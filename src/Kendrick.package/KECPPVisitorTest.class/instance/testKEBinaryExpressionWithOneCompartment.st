as yet unclassified
testKEBinaryExpressionWithOneCompartment
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp8 |
	tmp1 := KEBinaryExpression new.
	tmp3 := KEVariable symbol: #S.
	tmp4 := KENumerical new.
	tmp4 number: 2.
	tmp5 := #*.
	tmp1
		op: tmp5;
		leftHandSide: tmp3;
		rightHandSide: tmp4.
	tmp6 := KECPPVisitor new.
	tmp8 := KECompartment new.
	tmp8
		status: #S;
		initialValue: #(9999).
	tmp6 visitNode: (tmp8 numberOfSpecies: 1).
	tmp2 := tmp6 visitNode: tmp1.
	self assert: tmp2 contents = '(x(0, 0)*2)'