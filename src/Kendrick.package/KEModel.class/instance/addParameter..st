as yet unclassified
addParameter: input
	"input of a parameter to add must be in format: aSymbol->value"
	"|reader dic|
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
		]"
	self addParameter: input key value: input value
	