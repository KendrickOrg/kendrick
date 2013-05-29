as yet unclassified
acceptKEParameter: aNode
	| aStream |
	aStream := WriteStream on: (String new: 60).
	parameters at: (aNode symbol ) put: (aNode value).
	aStream nextPutAll: 'const double ', (aNode symbol) asString ,' = ', (aNode value) asString, ';';cr.
	^ aStream contents