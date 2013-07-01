as yet unclassified
printArray: anArray 
	|aStream count|
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: '{'.
	count := 0.
	anArray do: [ :each|
		count := count + 1.
		each isArray ifTrue: [ aStream nextPutAll: (self printArray: each) ]
		ifFalse: [ aStream nextPutAll: each asString ].
		count = (anArray size) ifFalse: [ aStream nextPutAll: ', ' ].			
		 ].
	aStream nextPutAll: '}'.
	^ aStream contents
	