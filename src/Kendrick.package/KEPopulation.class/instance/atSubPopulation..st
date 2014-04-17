accessing
atSubPopulation: anObject
	"This fuction will return a subPopulation or a Compartment"
	anObject isSymbol ifTrue: [ ^ self atCompartment: anObject ].
	anObject = 0 ifTrue: [ ^ self ].
	anObject isCollection ifTrue: [ 
		|temp|
		temp := self.
		anObject do: [ :each| temp := temp atSubPopulation: each ].
		^ temp
		 ].
	^ subPopulations at: anObject
	