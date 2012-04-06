
!KEEvent methodsFor: 'as yet unclassified'!
hasAnEventWithOppositeRateIn: aListOfEvents

aListOfEvents do: [:each |
	(each rate negated)  = (self rate) 
	ifTrue:[^true]
].
^false.
! !
