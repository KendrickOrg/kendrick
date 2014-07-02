as yet unclassified
check: event hasCoupling: aList
	^ (event rate checkHasVariable: aList) & ((KEVariable new symbol: event fromStatus) checkHasVariable: aList) & ((KEVariable new symbol: event toStatus) checkHasVariable: aList)
	