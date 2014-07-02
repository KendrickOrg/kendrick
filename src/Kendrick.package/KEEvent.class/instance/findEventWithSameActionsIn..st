as yet unclassified
findEventWithSameActionsIn: aListOfEvents

aListOfEvents do: [:each |
	((each eqIndex = self eqIndex) and: [self compareWithActionsOf: each]) ifTrue: [^ each]
]. 
^nil