
!KEExpressionTest methodsFor: 'as yet unclassified'!
testNormalizeKEExpression
	| e s beta minusBeta|
	
	e := KEBinaryExpression new.
	s := KEVariable symbol: #S.
	beta := KEVariable new symbol: #beta.
	
	minusBeta := (KEUnaryExpression new) op:#-.
	minusBeta expression: beta.
	
	e
		op: #*;
		leftHandSide: s;
		rightHandSide: minusBeta.
	
	self assert: true equals: (e normalize) isUnaryExpression.
	self assert: true equals: (e normalize normalize) isUnaryExpression
	! !
