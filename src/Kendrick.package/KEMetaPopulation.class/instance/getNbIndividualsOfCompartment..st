accessing
getNbIndividualsOfCompartment: aSymbol
	"This function will return the number of all individuals with a clinic status in population"
	|count|
	count := 0.
	subPopulations do: [ :each| 
		count := count + (each getNbIndividualsOfCompartment: aSymbol)
		].
	^ count
	