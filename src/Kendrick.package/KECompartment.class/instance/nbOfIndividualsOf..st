accessing
nbOfIndividualsOf: aSymbol
	(status = aSymbol) ifTrue: [ ^ currentNbIndividuals ].
	^ 0