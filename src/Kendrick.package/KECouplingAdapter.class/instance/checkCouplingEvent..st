as yet unclassified
checkCouplingEvent: event
	|compartmentSymbols|
	compartmentSymbols := self model compartmentSymbols.
	^ (event rate checkHasVariable: compartmentSymbols) & 
	  ((KEVariable new symbol: event fromStatus) checkHasVariable: compartmentSymbols) & 
	  ((KEVariable new symbol: event toStatus) checkHasVariable: compartmentSymbols)
	
	