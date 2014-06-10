accessing
log
	| new |
	new := data collect: [ :each | each log ].
	^ KESeries from: new withIndex: index copy