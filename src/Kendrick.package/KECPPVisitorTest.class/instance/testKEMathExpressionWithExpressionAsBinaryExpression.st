as yet unclassified
testKEMathExpressionWithExpressionAsBinaryExpression
	|input visitor result expr|
	expr := KEBinaryExpression new 
				op: #*; 
				leftHandSide: (KENumerical new number: 2);
				rightHandSide: (KEVariable new symbol: #t).
	input := KEMathExpression new function: #cos; exprInFunction: expr .
	visitor := KECPPVisitor new.
	result := visitor visitNode: input.
	
	self assert: result = 'cos(2*t)'.
	