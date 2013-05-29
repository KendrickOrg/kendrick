as yet unclassified
acceptKEEQuation:  aNode
	|expression aStream |
	aStream := WriteStream on: (String new: 60).
	expression := aNode expression.
	aStream nextPutAll: 'dxdt['.
	aStream nextPutAll: (compartments at: aNode variable symbol) asString, ']='.
	aStream nextPutAll: (self visitNode: expression).
	aStream nextPutAll: ';';cr.
	^ aStream contents
		
