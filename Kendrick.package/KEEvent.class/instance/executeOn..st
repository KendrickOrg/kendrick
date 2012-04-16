as yet unclassified
executeOn: aModel

|  old |
actions keysAndValuesDo:[:status :modification |
	old := (aModel atCompartment: (status value asSymbol)) numberOfIndividuals.
	(aModel atCompartment: (status value asSymbol)) numberOfIndividuals: (old+modification).
	]
	
