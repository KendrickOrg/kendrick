as yet unclassified
acceptKEVariable: aNode
	|k aStream|
	aStream := WriteStream on: (String new: 60).
	k := parameters at: (aNode symbol) ifAbsent: [nil]. 
	k ifNil: [ aStream nextPutAll: 'x[' , (compartments at: aNode symbol) asString , ']' ] 
	   ifNotNil:  [ aStream nextPutAll: aNode symbol asString ].
	^ aStream contents
