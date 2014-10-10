accessing
getNbIndividualsOfCompartment: aSymbol
	(status = aSymbol) ifTrue: [ ^ currentNbIndividuals ].
	^ 0