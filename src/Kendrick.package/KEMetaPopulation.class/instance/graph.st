accessing
graph
	"If graph is not defined and this is a population, so par defaut, initialize a network"
	graph ifNil: [ 
		self isPopulation ifTrue: [ 
			graph := KENetwork on: self
			 ]
		 ].
	^ graph