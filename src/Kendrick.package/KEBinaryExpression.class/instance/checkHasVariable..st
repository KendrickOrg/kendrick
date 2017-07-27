printing
checkHasVariable: arg1
	^ (leftHandSide checkHasVariable: arg1)
		| (rightHandSide checkHasVariable: arg1)