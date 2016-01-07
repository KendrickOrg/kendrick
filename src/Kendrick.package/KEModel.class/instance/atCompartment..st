as yet unclassified
atCompartment: anObject
	|key c|
	anObject = #empty ifTrue: [ 
		^ self atParameter: #N ].
	anObject isString ifTrue: [ key := STON fromString: anObject ].
	anObject isDictionary ifTrue: [ key := anObject ].
	anObject isArray ifTrue: [ key := Dictionary newFrom: anObject ].
	c := self attributes keys select: [ :a| (key keys includes: a) not].
	c size = 0 
	ifTrue: [ ^ self population sizeOfACompartment: key ]
	ifFalse: [ ^ ((self atAttribute: c first) collect: [ :e| |tmp|
			tmp := key copy.
			tmp at: c first put: e.
			self population sizeOfACompartment: tmp
		]) ]
	
	
	
	
	
	