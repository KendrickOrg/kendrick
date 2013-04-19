as yet unclassified
testKEBinaryExpressionWithOneCompartment
	| input result a b o visitor |
	input := KEBinaryExpression new.
	a := KEVariable symbol: #S.
	b := KENumerical new.
	b number: 2.
	o := #*.
	input
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	visitor := KendrickCPPVisitor new.
	visitor visitNode: (KECompartment new status: #S).
	result := visitor visitNode: input.
	self assert: result contents = 'x[0]*2'