adding
addParameters: input
	"input must be anArray of associations, each association is in format aSymbol->value corresponding to a parameter"
	"|reader dic|
	input isString 
	ifTrue: [ 
		reader := (STONReader on: input readStream) allowComplexMapKeys: true.
		dic := reader next.
		dic keysAndValuesDo: [ :k :v|
			self addParameter: k value: v ]
		]
	ifFalse: [  
		input do: [ :e| self addParameter: e key value: e value ]
		]"
	input do: [ :e| self addParameter: e key value: e value ]
	
	