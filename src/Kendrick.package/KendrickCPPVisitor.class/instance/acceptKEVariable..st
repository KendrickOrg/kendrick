as yet unclassified
acceptKEVariable: aNode
	aNode symbol size = 1
		ifTrue: [ stream nextPutAll: 'x[' , (compartments at: aNode symbol) asString , ']' ]
		ifFalse: [ stream nextPutAll: aNode symbol asString ]