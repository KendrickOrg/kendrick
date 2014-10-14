accessing
subPopulations
	"Return a list of all sub populations"
	|list|
	list := OrderedCollection new.
	self isPopulation ifTrue: [ 
		list add: self.
		^ list ].
	subPopulations do: [ :each|
		each isPopulation
		ifTrue: [ list add: each ]
		ifFalse: [ list addAll: each subPopulations ]
		 ].
	^ list