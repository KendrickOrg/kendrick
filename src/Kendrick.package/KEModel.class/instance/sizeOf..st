as yet unclassified
sizeOf: anObject
	|key|
	anObject isString ifTrue: [ key := STON fromString: anObject ].
	anObject isDictionary ifTrue: [ key := anObject ].
	key ifNotNil: [ 
		^ compartments at: key ifAbsent: [ 
				|c|
				c := KEDictionary new.
				compartments keysAndValuesDo: [ :k :v|
					(k associations includesAll: (key associations)) ifTrue: [ 
						|temp|
						temp := k copy.
						key keysDo: [ :each| temp removeKey: each ].
						c at: temp put: v
					] 
				].
				^ c values sum
		 ]
	].
	^ self error: 'Argument must be a String of/or a Dictionary'
	
	
	
	