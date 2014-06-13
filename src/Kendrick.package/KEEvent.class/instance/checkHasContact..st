accessing
checkHasContact: aList
	^ (self rate checkHasVariable: aList) & ((KEVariable new symbol: self fromStatus) checkHasVariable: aList) & ((KEVariable new symbol: self toStatus) checkHasVariable: aList)