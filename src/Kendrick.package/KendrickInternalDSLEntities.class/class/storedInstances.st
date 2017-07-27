as yet unclassified
storedInstances
	| tmp2 |
	tmp2 := storedInstances.
	^ tmp2
		ifNil: [ storedInstances := OrderedCollection new ]
		ifNotNil: [ tmp2 ]