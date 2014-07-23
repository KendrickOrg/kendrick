accessing
compartments: aCollection defNetwork: type numberOfContacts: n surface: surface
	"Simplest DSL that add a collection of compartments as sub-population into population"
	"i.e: population compartments: #((S 10000) (I 0) (R 0))"
	"self compartments: aCollection."
	self compartments: aCollection.
	"graph := (KENetwork new: (self getNbIndividuals) type: type contact: n surface: surface) initIndividuals: aCollection in: (self id asArray)"
	graph := (KENetwork type: type numberOfContacts: n surface: surface population: self) initNetworkNodes: (self getNbIndividuals)
	