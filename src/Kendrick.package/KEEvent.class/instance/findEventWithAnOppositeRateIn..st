as yet unclassified
findEventWithAnOppositeRateIn: aListOfEvents

aListOfEvents do: [:each |
	((each eqIndex = self eqIndex) and: [each rate negated  = self rate]) ifTrue: [^each]
]. 
^nil