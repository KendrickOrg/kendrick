as yet unclassified
acceptKENumerical: aModelNode
	| aStream |
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: (aModelNode number) asString.
	^ aStream contents