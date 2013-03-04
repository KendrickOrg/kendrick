as yet unclassified
executeOn: aModel
"Modify this function for the case of equation S[i]:t=expression"
|  old |
actions keysAndValuesDo:[:status :modification |
	(self eqIndex = -1) ifTrue: [
		old := (aModel atCompartment: (status value asSymbol)) numberOfIndividuals.
		(aModel atCompartment: (status value asSymbol)) numberOfIndividuals: (old+modification).
		] ifFalse: [
		old := ((aModel atCompartment: (status symbol)) numberOfIndividuals) at: (self eqIndex).
		aModel atCompartment: (status symbol) at: (self eqIndex) modifyNumberOfIndividuals: (old + modification).
		]	
	]
	
