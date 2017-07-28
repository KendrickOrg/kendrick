printing
printOn: aStream	
	aStream 
			nextPutAll: symbol asString.
	indexList do: [ :each|
		aStream nextPutAll: '[', each asString, ']'
		 ]
	
		
	