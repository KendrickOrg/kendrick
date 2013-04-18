as yet unclassified
testKEBinaryExpressionWithOneVariable
	| input result a b o |
	input := KEBinaryExpression new.
	a := KEVariable symbol:#a.
	b := KENumerical new.
	b number: 7.
	o := #+.
	input
		op: o;
		leftHandSide: a;
		rightHandSide: b.

	result := KendrickCPPVisitor new visitNode: input.
	
	self assert: result contents = 'a+7'.
	