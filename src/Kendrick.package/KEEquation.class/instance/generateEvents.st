as yet unclassified
generateEvents

| l |
l := expression generateEvents.
l do: [:each | | status|
	(self eqIndex = -1) ifTrue: [
		status := variable symbol.
		each eqIndex: -1.
		(each rate sign positive)
		ifTrue:[	each addOneIndividualTo: status]
		ifFalse:[ each removeOneIndividualFrom:  status]
	] ifFalse: [
		status := (KEIndex new) symbol: (variable symbol); idExpression1: eqIndex; idExpression2: -1.
		each eqIndex: (self eqIndex).
		each eqIndexVar: (self idVariable).
		(each rate sign positive)
		ifTrue:[ each addOneIndividualTo: status]
		ifFalse:[ each removeOneIndividualFrom:  status]
		]	
	].
^l