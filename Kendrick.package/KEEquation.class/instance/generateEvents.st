as yet unclassified
generateEvents

| l |
l := expression generateEvents.
l do: [:each | | status|
	(self idVariable isNil) ifTrue: ["Event: S-->1, I-->-1"
		status := variable.
		each eqIndex: 1.
		each eqIndexVar: nil.
		(each rate sign positive)
		ifTrue:[ each addOneIndividualTo: status]
		ifFalse:[ each removeOneIndividualFrom:  status]
	] ifFalse: ["Event: S[1]-->1, S[2]-->1, I[1]-->-1, I[2]-->-1 (S[1] isClassOf: KEIndex)"
		status := (KEIndex new) symbol: (variable symbol); idExpression1: eqIndex; idExpression2: -1.
		each eqIndex: (self eqIndex).
		each eqIndexVar: (self idVariable).
		(each rate sign positive)
		ifTrue:[ each addOneIndividualTo: status]
		ifFalse:[ each removeOneIndividualFrom:  status]
		]	
	].
^l