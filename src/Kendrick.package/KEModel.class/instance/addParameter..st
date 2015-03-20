as yet unclassified
addParameter: input
	|reader dic|
	input isString 
	ifTrue: [ 
		reader := (STONReader on: input readStream) allowComplexMapKeys: true.
		dic := reader next.
		dic keysAndValuesDo: [ :k :v|
			parameters at: k put: v
			]
		]
	ifFalse: [  
		parameters at: input key put: input value
		]
	
	