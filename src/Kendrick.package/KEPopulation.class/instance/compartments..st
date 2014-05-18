accessing
compartments: aCollection
	"Simplest DSL that add a collection of compartments as sub-population into population"
	"i.e: population compartments: #((S 10000) (I 0) (R 0)) or a vector with"
	aCollection do: [ :each|
		|node|
		nodeNames detect: [ :name| (#first value: each) = name ] 
		ifFound: [ 
			(self at: (#first value: each)) initialNbIndividuals: (#second value: each)			
			 ] 
		ifNone: [ 
			node := KECompartment status: (#first value: each) initialNumberOfIndividuals: (#second value: each).
			self addSubPopulation: node.
			nodeNames add: (#first value: each).
			 ].
		
		
		 ].
	