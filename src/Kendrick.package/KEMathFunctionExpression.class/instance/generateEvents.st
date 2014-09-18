as yet unclassified
generateEvents
	| list e |
	list := OrderedCollection new.
	e := KEEvent new.
	e rate: functionExpr.
	list add: e.
	^ list