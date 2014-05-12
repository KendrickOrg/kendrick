as yet unclassified
getPIDListOf: aPopulation
	|aStack|
	PIDList := OrderedCollection new.
	aStack := OrderedCollection new.
	self doDFSOn: aPopulation with: aStack.
	PIDList ifNotNil: [ PIDList := PIDList asArray ].
	^ PIDList
	