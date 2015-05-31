as yet unclassified
addParameters: input
	|reader dic|
	input isString 
	ifTrue: [ 
		reader := (STONReader on: input readStream) allowComplexMapKeys: true.
		dic := reader next.
		dic keysAndValuesDo: [ :k :v| |tmp|
			v isDictionary ifTrue: [ 
				tmp := parameters at: k ifAbsentPut: (Dictionary new).
				tmp addAll: v ]
			ifFalse: [ parameters at: k put: v ]
			]
		]
	ifFalse: [  
		input do: [ :e| parameters at: e key put: e value ]
		]
	
	