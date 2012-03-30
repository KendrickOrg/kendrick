
!KEEvent methodsFor: 'as yet unclassified'!
findEventWithAnOppositeRateIn: aListOfEvents

aListOfEvents do: [:each |
	each rate negated  = self rate 
	ifTrue:[^each]
]. 
^nil.! !
