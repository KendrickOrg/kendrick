as yet unclassified
generateEvents
	| list e |
	list := OrderedCollection new.
	e := KEEvent new.
	e rate: exprInFunction.
	list add: e