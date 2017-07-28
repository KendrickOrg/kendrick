testing
addExpression: anExpression
	^ KEBinaryExpression new
		op: #+;
		leftHandSide: self;
		rightHandSide: anExpression