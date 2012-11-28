tests
testNormalizeKEExpression
	| e s beta minusBeta k minusS |
	
	e := KEBinaryExpression new.
	s := KEVariable symbol: #S.
	beta := KEVariable new symbol: #beta.
	minusS := (KEUnaryExpression new) op:#-.
	minusS expression: s.
	minusBeta := (KEUnaryExpression new) op:#-.
	minusBeta expression: beta.
	
	e
		op: #*;
		leftHandSide: s;
		rightHandSide: minusBeta.	
	k := e normalize.
	self assert: true equals: ((k negated) = e).
	
	self assert: (k normalize) isUnaryExpression.
	self assert: (k normalize) isUnaryExpression		
	