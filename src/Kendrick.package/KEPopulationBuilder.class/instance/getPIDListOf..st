as yet unclassified
getPIDListOf: population
	|aStack|
	PIDList := OrderedCollection new.
	aStack := OrderedCollection new.
	self doDFSOn: population with: aStack.
	PIDList ifNotNil: [ PIDList := PIDList asArray ].
	^ PIDList
	