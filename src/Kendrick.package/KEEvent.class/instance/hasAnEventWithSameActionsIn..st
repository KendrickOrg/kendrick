testing
hasAnEventWithSameActionsIn: aListOfEvents

aListOfEvents do: [:each |
	((each actions  = self actions) and: [each eqIndex = self eqIndex]) ifTrue: [^true]
]. 
^false.
