as yet unclassified
printOn: aStream
	idExpression2 = -1
	ifTrue: [
		aStream 
			nextPutAll: symbol asString,'[',idExpression1 asString,']'] 
	ifFalse: [
		aStream 
			nextPutAll: symbol asString,'[',idExpression1 asString,',',idExpression2 asString ,']'] 
		
	