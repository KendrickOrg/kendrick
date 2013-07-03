as yet unclassified
acceptKEIndexedVariable:  aNode 
	|k aStream |
	aStream := WriteStream on: (String new: 60).
	aNode idExpression1 isNumber ifFalse: [ 
		aNode idExpression1 = 'j' ifFalse: [ aNode idExpression1: 'i' ]		
		].
	aNode idExpression2 isNumber ifFalse: [ 
		aNode idExpression2 = 'i' ifFalse: [ aNode idExpression2: 'j' ]
		].
	eventIndex = -1 ifFalse: [ 
		aNode idExpression1 = 'j' ifFalse: [ aNode idExpression1: eventIndex ]
		 ].
	k := parameters at: (aNode symbol) ifAbsent: [nil]. 
	k ifNil: [ 	
		isDeterministic ifTrue: [ aStream nextPutAll: 'x(', (compartments at: aNode symbol) asString, ', ', aNode idExpression1 asString, ')' ]	
		ifFalse: [ aStream nextPutAll: 'x[', (compartments at: aNode symbol) asString, '][', aNode idExpression1 asString, ']' ]
	] 
	   ifNotNil:  [ 
	aNode  idExpression2  = -1
	ifTrue: [ 
		aStream nextPutAll: aNode symbol asString, '[',  aNode  idExpression1 asString ,']' 
		]
	ifFalse: [
		aStream nextPutAll: aNode symbol asString, '[',  aNode  idExpression1 asString ,'][', aNode  idExpression2 asString , ']'
		]
	 ].
	^ aStream contents
		
