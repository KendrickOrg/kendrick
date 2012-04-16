as yet unclassified
generateEvents
|list |
list := Bag new.
(op = #*)|(op  = #/)|(op   = #^) ifTrue:[
	|e|
	e := KEEvent new.
	e rate: self normalize.
	list add:e].

(op   = #+)
ifTrue:[
	|l1 l2|
l1 := leftHandSide generateEvents.	
l2 := rightHandSide generateEvents.
list addAll:l1.
list addAll:l2.
].

(op   = #-)
ifTrue:[
	|l1 l2 o|
	l1 := leftHandSide generateEvents.
	l2 := ((KEUnaryExpression new) op: #-; expression: rightHandSide) generateEvents.
	l1 ifNotNil:[list addAll:l1].
	list addAll:l2.
	].
^list