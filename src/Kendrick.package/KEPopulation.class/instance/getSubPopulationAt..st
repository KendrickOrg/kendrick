accessing
getSubPopulationAt: anObject
	"This fuction will return a subPopulation or a Compartment"
	anObject isSymbol ifTrue: [ ^ self getCompartment: anObject ].
	^ subPopulations at: anObject
	