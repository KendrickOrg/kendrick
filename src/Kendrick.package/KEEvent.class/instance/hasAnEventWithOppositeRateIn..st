testing
hasAnEventWithOppositeRateIn: aListOfEvents

aListOfEvents do: [:each |
	((each eqIndex = self eqIndex) and: [each rate negated  = self rate]) ifTrue: [^true]
]. 
^false
