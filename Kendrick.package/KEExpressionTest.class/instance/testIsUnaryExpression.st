tests
testIsUnaryExpression
	| beta minusBeta s betaS |
	
	beta := KEVariable symbol: #beta.
	minusBeta := (KEUnaryExpression new) op:#-.
	minusBeta expression: beta.
	
	s := KEVariable symbol: #S.
	
	betaS := (KEBinaryExpression new) op:#*.
	betaS rightHandSide: s.
	betaS leftHandSide: beta.
	
	self assert: true equals: minusBeta isUnaryExpression.
	self assert: false equals: betaS isUnaryExpression.