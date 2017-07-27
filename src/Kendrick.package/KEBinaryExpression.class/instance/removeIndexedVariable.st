evaluating
removeIndexedVariable
	| tmp1 |
	tmp1 := self copy.
	tmp1
		leftHandSide: tmp1 leftHandSide removeIndexedVariable;
		rightHandSide: tmp1 rightHandSide removeIndexedVariable.
	^ tmp1