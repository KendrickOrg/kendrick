as yet unclassified
acceptKEMathExpression: aNode
	|aStream|
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: (aNode functionName asString).
	(aNode exprInFunction class == KEVariable) | (aNode exprInFunction class == KENumerical) 
		ifTrue: [ aStream nextPutAll: '(' ].
	aStream nextPutAll: (self visitNode: aNode exprInFunction).
	(aNode exprInFunction class == KEVariable) | (aNode exprInFunction class == KENumerical) 
		ifTrue: [ aStream nextPutAll: ')' ].
	^ aStream contents
	