accessing
addIndividual: aNumber
	aNumber < 0 ifTrue: [ self removeIndividual: (aNumber negated) ]
	ifFalse: [ currentNbIndividuals := currentNbIndividuals + aNumber. ]
	