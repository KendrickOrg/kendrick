as yet unclassified 
prepareArray: anArray 
	|aStream|
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: '[', anArray size asString, ']'.
	(anArray at: 1) isArray ifTrue: [ aStream nextPutAll: (self prepareArray: (anArray at: 1)) ]
	ifFalse: [ aStream nextPutAll: ' = ' ].
	^ aStream contents