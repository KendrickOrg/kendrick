as yet unclassified
testKEBinaryExpression
	| input result a b o |
	input := KEBinaryExpression new.
	a := KENumerical new.
	a number: 3.
	b := KENumerical new.
	b number: 7.
	o := #+.
	input
		op: o;
		leftHandSide: a;
		rightHandSide: b.

	result := KendrickCPPVisitor new visitNode: input.
	
	self assert: result contents = '3+7'.
	