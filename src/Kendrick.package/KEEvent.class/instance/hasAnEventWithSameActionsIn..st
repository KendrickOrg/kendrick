testing
hasAnEventWithSameActionsIn: aListOfEvents

aListOfEvents do: [:each |
	((each eqIndex = self eqIndex) and: [self compareWithActionsOf: each]) ifTrue: [^true]
]. 
^false.
