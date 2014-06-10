as yet unclassified
generateEvents
	| list e |
	list := Bag new.
	e := KEEvent new.
	e rate: exprInFunction.
	list add: e