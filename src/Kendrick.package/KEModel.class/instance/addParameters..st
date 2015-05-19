as yet unclassified
addParameters: input
	|reader dic|
	input isString 
	ifTrue: [ 
		reader := (STONReader on: input readStream) allowComplexMapKeys: true.
		dic := reader next.
		dic keysAndValuesDo: [ :k :v|
			self addParameter: k value: v ]
		]
	ifFalse: [  
		input do: [ :e| self addParameter: e key value: e value ]
		]
	
	