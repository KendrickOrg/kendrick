accessing
compartments: aCollection defNetwork: type contact: n surface: surface
	"Simplest DSL that add a collection of compartments as sub-population into population"
	"i.e: population compartments: #((S 10000) (I 0) (R 0))"
	"self compartments: aCollection."
	self compartments: aCollection.
	graph ifNil: [ graph := (KENetwork new: (self getNbIndividuals) type: type contact: n surface: surface) initializeInd: aCollection in: (self id) ]
	