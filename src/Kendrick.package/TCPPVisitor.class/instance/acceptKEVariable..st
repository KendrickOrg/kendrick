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
		"ThanhNT 9/7"
		"(self compartments) at: (aNode symbol) ifAbsent: ["
			(self checkSymbol: aNode) == -1 ifTrue: [ 
			aStream nextPutAll: (aNode symbol asString). 
			^ aStream contents.
		"Endof ThanhNT 9/7"
			].
		"ThanhNT 9/7"
		"isDeterministic ifTrue: [ aStream nextPutAll: 'x(' , ((self compartments) at: aNode symbol) asString , ', 0)' ]		"
		isDeterministic ifTrue: [ aStream nextPutAll: 'x[' , ((self checkSymbol: aNode) asString) , ']' ]		
		"Endof ThanhNT 9/7"		
		"ifFalse: [ aStream nextPutAll: 'x[' , ((self compartments) at: aNode symbol) asString , '][0]' ]"
		ifFalse: [ aStream nextPutAll: 'x[' , ((self checkSymbol: aNode) asString) , ']' ]
	] ifNotNil:  [ 
		aStream nextPutAll: aNode symbol asString
		].
	^ aStream contents
