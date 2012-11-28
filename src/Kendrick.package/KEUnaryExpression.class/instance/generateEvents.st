as yet unclassified
generateEvents
	| e |
	e := KEEvent new.
	e rate: self normalize.
	^ Bag with: e