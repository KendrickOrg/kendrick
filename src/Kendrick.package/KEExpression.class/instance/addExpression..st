testing
addExpression: anExpression
	|new|
	new := KEBinaryExpression new op: #+; leftHandSide: self; rightHandSide: anExpression.
	^ new