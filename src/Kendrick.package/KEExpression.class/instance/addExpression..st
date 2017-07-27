testing
addExpression: arg1
	| tmp2 |
	tmp2 := KEBinaryExpression new.
	tmp2
		op: #+;
		leftHandSide: self.
	^ tmp2 rightHandSide: arg1