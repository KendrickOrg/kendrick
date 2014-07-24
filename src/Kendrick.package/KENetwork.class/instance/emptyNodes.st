accessing
emptyNodes
	emptyNodes ifNil: [ emptyNodes := OrderedCollection new ].
	^ emptyNodes