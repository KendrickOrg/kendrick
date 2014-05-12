accessing
addSubPopulation: anObject
	"This function will add a new subpopulation or a new compartment for the current population"
	|populationID|
	populationID := self id copy.
	populationID add: (nodes size + 1).
	anObject id: "(nodes size + 1)" populationID.
	anObject parent: self.
	nodes addLast: anObject