printing
checkHasVariable: aDictionary
	^ aDictionary at: symbol ifAbsent: [ ^ false ]