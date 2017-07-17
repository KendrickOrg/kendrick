as yet unclassified 
acceptKENumerical: aKENNode
	| aStream |
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: (aKENNode number) asString.
	^ aStream contents