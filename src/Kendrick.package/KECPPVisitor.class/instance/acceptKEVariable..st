as yet unclassified
acceptKEVariable: aNode
	|k aStream |
	aStream := WriteStream on: (String new: 60).
	aNode symbol == #t ifTrue: [ 
		aStream nextPutAll: (aNode symbol asString). 
		^ aStream contents
		].
	k := parameters at: (aNode symbol) ifAbsent: [nil]. 		
	k ifNil: [ 
		compartments at: (aNode symbol) ifAbsent: [ 
			aStream nextPutAll: (aNode symbol asString). 
			^ aStream contents. 
			].
		isDeterministic ifTrue: [ aStream nextPutAll: 'x(' , (compartments at: aNode symbol) asString , ', 0)' ]		
		ifFalse: [ aStream nextPutAll: 'x[' , (compartments at: aNode symbol) asString , '][0]' ]
	] ifNotNil:  [ 
		aStream nextPutAll: aNode symbol asString
		].
	^ aStream contents
