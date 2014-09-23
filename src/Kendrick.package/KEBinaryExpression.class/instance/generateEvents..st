as yet unclassified
generateEvents: population
|list |
list := OrderedCollection new.
(op = #*)|(op  = #/)|(op   = #'^') ifTrue:[
	self isSeparable ifTrue: [
		|l|
		l := self separateExpression.
		l do: [:each|
			|e|
			e := KEEvent new.
			e rate: each normalize.
			list add:e
			]
		]
	ifFalse: [
		|e|
		e := (KEEvent new) rate: self normalize.
		list add: e.
		]
	].

(op   = #+)
ifTrue:[
	|l1 l2|
l1 := leftHandSide generateEvents: population.	
l2 := rightHandSide generateEvents: population.
list addAll:l1.
list addAll:l2.
].

(op   = #-)
ifTrue:[
	|l1 l2|
	l1 := leftHandSide generateEvents: population.
	l2 := ((KEUnaryExpression new) op: #-; expression: rightHandSide) generateEvents: population.
	l1 ifNotNil:[list addAll:l1].
	list addAll:l2.
	].
^list