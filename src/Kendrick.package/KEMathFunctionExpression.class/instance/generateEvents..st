as yet unclassified
generateEvents: population
	| list e |
	list := OrderedCollection new.
	e := KEEvent new.
	e rate: functionExpr.
	list add: e.
	^ list