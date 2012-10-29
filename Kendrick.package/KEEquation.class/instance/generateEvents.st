as yet unclassified
generateEvents

| l |
l := expression generateEvents.
l do: [:each | | status|
	status := variable symbol.
	each eqIndex: -1.
	(each rate sign positive)
	ifTrue:[	each addOneIndividualTo: status]
	ifFalse:[ each removeOneIndividualFrom:  status]
	].
^l