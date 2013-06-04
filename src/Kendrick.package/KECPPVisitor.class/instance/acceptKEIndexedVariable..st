as yet unclassified
acceptKEIndexedVariable:  aNode 
	|k aStream |
	aStream := WriteStream on: (String new: 60).

	aNode symbol == #t
		ifTrue: [ 
			aStream nextPutAll: (aNode symbol asString). 
			^ aStream contents].

	k := parameters at: (aNode symbol) ifAbsent: [nil]. 
	k ifNil: [ 
			aStream nextPutAll: 'x[' ,  (aNode  idExpression1  ) asString , '+',(compartments at:  (aNode symbol ) asString) asString ,'* nbOfSpecies' , ']'.
	] 
	   ifNotNil:  [ 
	aNode  idExpression2  = -1
	ifTrue: [ aStream nextPutAll: (aNode symbol) asString, '[',  (aNode  idExpression1  ) asString ,']' ]
	ifFalse: [  aStream nextPutAll: (aNode symbol) asString, '[',  (aNode  idExpression1 ) asString ,'][', (aNode  idExpression2  ) asString , ']'].
	 ].
	
	
	
	
	^ aStream contents
		
