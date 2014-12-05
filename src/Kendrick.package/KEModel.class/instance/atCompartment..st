as yet unclassified
atCompartment: anObject
	|key|
	anObject = #empty ifTrue: [ ^ 1 ].
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
				c size = 0 ifTrue: [ ^ self error: 'Do not have the compartment named: ', key asString ].
				^ c 
		 ]
	].
	^ self error: 'Argument must be a String of/or a Dictionary'
	
	
	
	