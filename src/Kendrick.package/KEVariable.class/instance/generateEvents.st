as yet unclassified
generateEvents
	| tmp1 tmp2 |
	tmp1 := OrderedCollection new.
	tmp2 := KEEvent new.
	tmp2 rate: self.
	tmp1 add: tmp2.
	^ tmp1