as yet unclassified
hasAnEventWithOppositeRateIn: aListOfEvents

aListOfEvents do: [:each |
	((each rate negated  = self rate) and: [each eqIndex = self eqIndex]) ifTrue: [^true]
]. 
^false.
