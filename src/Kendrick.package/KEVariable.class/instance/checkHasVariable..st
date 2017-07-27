printing
checkHasVariable: arg1
	^ arg1 at: symbol ifAbsent: [ ^ false ]