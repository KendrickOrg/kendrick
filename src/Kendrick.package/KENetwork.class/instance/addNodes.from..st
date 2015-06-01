as yet unclassified
addNodes: anArray from: population
	anArray do: [ :each| self addNode: {attribute->each} ]