accessing
atCompartment: anObject
	| key c |
	"anObject = #empty
		ifTrue: [ ^ self atParameter: #N ]."
	anObject isString
		ifTrue: [ key := STON fromString: anObject ].
	anObject isDictionary
		ifTrue: [ key := anObject ].
	anObject isArray
		ifTrue: [ key := Dictionary newFrom: anObject ].
	((key at: #status) = #empty) ifTrue: [ ^ self atParameter: #N ].
	c := self attributes keys reject: [ :a | key keys includes: a ].
	c isEmpty
		ifTrue: [ ^ self population sizeOfACompartment: key ]
		ifFalse: [ ^ (self atAttribute: c first)
				collect: [ :e | 
					| tmp |
					tmp := key copy.
					tmp at: c first put: e.
					self population sizeOfACompartment: tmp ] ]