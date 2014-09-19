as yet unclassified
generateEvents"to delete"
	| list e |
	list := OrderedCollection new.
	e := KEEvent new.
	e rate: functionExpr.
	list add: e.
	^ list