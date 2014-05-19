as yet unclassified
checkHasVariable: aDictionary
	^ aDictionary at: symbol ifAbsent: [ ^ false ]