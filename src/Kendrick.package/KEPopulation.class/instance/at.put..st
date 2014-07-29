accessing
at: aCompartmentSymbol put: aNumber
	|compartment|
	compartment := self at: aCompartmentSymbol. 
	compartment initialNbIndividuals: aNumber. 
	compartment currentNbIndividuals: aNumber.
	^ compartment
	
	
	