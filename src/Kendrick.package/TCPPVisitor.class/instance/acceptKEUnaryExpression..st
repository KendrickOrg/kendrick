as yet unclassified 
acceptKEUnaryExpression: aNode
	| aStream |
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: '('.
	aStream nextPutAll: aNode op.
	aStream nextPutAll: (self visitNode: aNode expression).
	aStream nextPutAll: ')'.
	^ aStream contents