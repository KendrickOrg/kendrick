adding
addEquations: aCollectionOfEquations
	aCollectionOfEquations do: [ :equation | self addEquation: equation parseAsAnEquation ]