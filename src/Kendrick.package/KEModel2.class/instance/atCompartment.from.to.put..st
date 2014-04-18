as yet unclassified
atCompartment: aSymbol from: anIndex to: anotherIndex put: aNumber
	anIndex to: anotherIndex do: [ :id|
		self atCompartment: aSymbol at: id  put: aNumber 
		 ]
	