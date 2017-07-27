as yet unclassified
prepareArray: arg1
	| tmp1 |
	tmp1 := WriteStream on: (String new: 60).
	tmp1 nextPutAll: '[' , arg1 size asString , ']'.
	(arg1 at: 1) isArray
		ifTrue: [ tmp1 nextPutAll: (self prepareArray: (arg1 at: 1)) ]
		ifFalse: [ tmp1 nextPutAll: ' = ' ].
	^ tmp1 contents