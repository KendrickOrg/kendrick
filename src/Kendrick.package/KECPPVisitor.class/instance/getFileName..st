as yet unclassified
getFileName: aModel
	|aStream|
	aStream := WriteStream on: (String new: 10).
	aModel compartments do: [:each|
		aStream nextPutAll: (each status asString)
		].
	aStream nextPutAll: '.cpp'.
	^ aStream contents
	