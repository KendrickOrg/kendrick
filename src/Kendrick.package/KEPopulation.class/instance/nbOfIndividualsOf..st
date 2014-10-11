accessing
nbOfIndividualsOf: aSymbol
	"This function will return the number of all individuals with a clinic status in population"
	"|count|
	count := 0.
	nodes do: [ :each| 
		count := count + (each getNbIndividualsOfCompartment: aSymbol)
		].
	^ count"
	^ (self at: aSymbol) currentNbIndividuals 
	