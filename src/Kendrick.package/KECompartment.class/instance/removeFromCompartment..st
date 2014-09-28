accessing
removeFromCompartment: aNumber
	currentNbIndividuals := currentNbIndividuals - aNumber.
	"make sure that the population is always positive"
	currentNbIndividuals <= 0 ifTrue: [ 
		currentNbIndividuals := 0
		 ]