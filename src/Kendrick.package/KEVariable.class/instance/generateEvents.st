as yet unclassified
generateEvents"to delete"
	| list e |
	list := OrderedCollection new.
	e := KEEvent new.
	e rate: self.
	list add: e.
	^ list