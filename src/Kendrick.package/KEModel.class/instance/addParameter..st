as yet unclassified
addParameter: aString
	|reader dic|
	reader := (STONReader on: aString readStream) allowComplexMapKeys: true.
	dic := reader next.
	dic keysAndValuesDo: [ :key :value|
		value isDictionary ifTrue: [ 
			value keysAndValuesDo: [ :k :v|
				(v isDictionary and: [ v includesKey: #yourself ]) ifTrue:
					[ v at: key put: (v at: #yourself).
				 		v removeKey: #yourself.
						value at: k put: (KEDictionary from: v)
					].
			 	]
			]
		].
	dic keysAndValuesDo: [ :k :v| |tmp|
		v isDictionary ifTrue: [ 
			tmp := parameters at: k ifAbsentPut: (Dictionary new).
			tmp addAll: v ]
		ifFalse: [ parameters at: k put: v ]
		]