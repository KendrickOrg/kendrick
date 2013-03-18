as yet unclassified
generateEvents

	|list e|
	list := Bag new.
	(expression isUnaryExpression)|(expression isBinaryExpression) ifTrue: [
		|l|
		l := Bag new.
		list := expression generateEvents.
		list do:[:each|
			|oldRate|
			oldRate := each rate.
			each rate: ((KEUnaryExpression new) op: #-; expression: oldRate) normalize.
			l add: each.
			].
		^ l
		]
	ifFalse: [
		e := KEEvent new.
		e rate: self normalize.
		list add:e.		
		].
^list