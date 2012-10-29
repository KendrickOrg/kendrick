as yet unclassified
findEventWithAnOppositeRateIn: aListOfEvents

aListOfEvents do: [:each |
	((each rate negated  = self rate) and: [each eqIndex = self eqIndex]) ifTrue: [^each]
]. 
^nil.