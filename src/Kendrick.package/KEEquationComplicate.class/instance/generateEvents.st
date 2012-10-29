as yet unclassified
generateEvents

| l |
l := expression generateEvents.
l do: [:each | | status|
	status := (KEIndex new) symbol: (variable symbol); idExpression1: eqIndex; idExpression2: -1.
	each eqIndex: (self eqIndex).
	each eqIndexVar: (self idVariable).
	(each rate sign positive)
	ifTrue:[ each addOneIndividualTo: status]
	ifFalse:[ each removeOneIndividualFrom:  status]
	].
^l