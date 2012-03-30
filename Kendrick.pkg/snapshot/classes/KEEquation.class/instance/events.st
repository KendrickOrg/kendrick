
!KEEquation methodsFor: 'as yet unclassified'!
events

| l |
l := expression events.
l do: [:each | | status|
	status := variable symbol value.
	(each rate sign positive)
	ifTrue:[	each addOneIndividualTo: status]
	ifFalse:[ each removeOneIndividualFrom:  status]
	].
^l! !
