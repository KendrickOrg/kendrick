as yet unclassified
acceptKEIndexedVariable:  aNode 
	|k aStream |
	aStream := WriteStream on: (String new: 60).
	k := parameters at: (aNode symbol) ifAbsent: [nil]. 
	k ifNil: [ 	
		isDeterministic ifTrue: [ aStream nextPutAll: 'x(', (compartments at: aNode symbol) asString, ', ', aNode idExpression1 asString, ')' ]	
		ifFalse: [ aStream nextPutAll: 'x[', (compartments at: aNode symbol) asString, '][', aNode idExpression1 asString, ']' ]
	] 
	   ifNotNil:  [ 
	((aNode idExpression2 isNumerical) and:[aNode idExpression2 number = -1])
	ifTrue: [ 
		aStream nextPutAll: aNode symbol asString, '[',  aNode  idExpression1 asString ,']' 
		]
	ifFalse: [
		aStream nextPutAll: aNode symbol asString, '[',  aNode  idExpression1 asString ,'][', aNode  idExpression2 asString , ']'
		]
	 ].
	^ aStream contents
		
