accessing
addToCompartment: aNumber
	aNumber < 0 ifTrue: [ self removeFromCompartment: (aNumber negated) ]
	ifFalse: [ currentNbIndividuals := currentNbIndividuals + aNumber. ]
	