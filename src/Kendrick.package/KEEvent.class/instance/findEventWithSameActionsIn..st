as yet unclassified
findEventWithSameActionsIn: aListOfEvents

aListOfEvents do: [:each |
	((each actions  = self actions) and: [each eqIndex = self eqIndex]) ifTrue: [^each]
]. 
^nil.