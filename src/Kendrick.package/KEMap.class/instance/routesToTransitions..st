as yet unclassified
routesToTransitions: arg1
	| tmp1 |
	tmp1 := edges
		collect: [ :arg2 | 
			KETransition
				from: {(#country -> arg2 key)}
				to: {(#country -> arg2 value)}
				probability: arg1 ].
	^ tmp1