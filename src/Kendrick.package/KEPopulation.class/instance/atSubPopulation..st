accessing
atSubPopulation: anObject
	"This fuction will return a subPopulation or a Compartment"
	anObject isSymbol ifTrue: [ ^ self atCompartment: anObject ].
	anObject isCollection ifTrue: [ 
		|temp|
		temp := self.
		anObject = #(0) ifTrue: [ ^ self ].
		anObject do: [ :each| temp := temp atSubPopulation: each ].
		^ temp
		 ].
	^ subPopulations at: anObject
	