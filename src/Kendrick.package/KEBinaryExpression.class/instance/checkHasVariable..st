printing
checkHasVariable: aDictionary
	^ (leftHandSide checkHasVariable: aDictionary) | (rightHandSide checkHasVariable: aDictionary)