adding
addNodes: anArray from: population
	anArray do: [ :each| self addNode: {attribute->each} ]