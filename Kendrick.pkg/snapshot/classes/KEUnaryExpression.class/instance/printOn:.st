
!KEUnaryExpression methodsFor: 'as yet unclassified'!
printOn: aStream
	aStream 
		nextPutAll: '-';
		nextPutAll: expression asString! !
