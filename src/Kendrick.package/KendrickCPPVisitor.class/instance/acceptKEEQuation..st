as yet unclassified
acceptKEEQuation:  aNode
	|expression|
	expression := aNode expression.
	stream nextPutAll: 'dxdt['.
	stream nextPutAll: (compartments at: aNode variable symbol) asString, ']='.
	self visitNode: expression.
	stream nextPutAll: ';'
		
