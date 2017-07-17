as yet unclassified 
acceptKEMathExpression: aNode
	|aStream|
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: (aNode functionName asString).
	(aNode functionExpr class == KEVariable) | (aNode functionExpr class == KENumerical) 
		ifTrue: [ aStream nextPutAll: '(' ].
	aStream nextPutAll: (self visitNode: aNode functionExpr).
	(aNode functionExpr class == KEVariable) | (aNode functionExpr class == KENumerical) 
		ifTrue: [ aStream nextPutAll: ')' ].
	^ aStream contents
	