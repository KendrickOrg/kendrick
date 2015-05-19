as yet unclassified
evaluateWithModel: model
	|x|
	((model population attributes at: #status ifAbsent: [OrderedCollection new]) includes: symbol)
	ifTrue: [ 
		^ model numberContacts: { #status->symbol } ].
	x := model atParameter: symbol.
	^ x