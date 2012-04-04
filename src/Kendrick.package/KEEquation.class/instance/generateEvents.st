as yet unclassified
generateEvents

| l |
l := expression events.
l do: [:each | | status|
	status := variable symbol.
	(each rate sign positive)
	ifTrue:[	each addOneIndividualTo: status]
	ifFalse:[ each removeOneIndividualFrom:  status]
	].
^l