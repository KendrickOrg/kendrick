evaluating
evaluateWithModel: model
	|x|
	((model attributes at: #status ifAbsent: [OrderedCollection new]) includes: symbol)
	ifTrue: [ 
		^ model atCompartment: { #status->symbol } ].
	x := model atParameter: symbol.
	^ x