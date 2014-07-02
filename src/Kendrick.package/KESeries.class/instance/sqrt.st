accessing
sqrt
	| new |
	new := data collect: [ :each | each sqrt ].
	^ KESeries from: new withIndex: index copy