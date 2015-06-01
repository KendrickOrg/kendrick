as yet unclassified
addParameter: input
	|reader dic|
	input isString 
	ifTrue: [ 
		reader := (STONReader on: input readStream) allowComplexMapKeys: true.
		dic := reader next.
		dic keysAndValuesDo: [ :k :v|
			self addParameter: k value: v 
			]
		]
	ifFalse: [  
		self addParameter: input key value: input value 
		]
	
	