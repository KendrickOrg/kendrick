as yet unclassified
acceptKEParameter: aNode
	| aStream |
	aStream := WriteStream on: (String new: 60).
	parameters at: aNode symbol put: aNode value.
	aNode value isInterval ifTrue: [ ^ aStream contents ].
	aNode value isArray ifTrue: [ 
		aStream nextPutAll: 'const double ', aNode symbol asString.
		aStream nextPutAll: (self prepareArray: aNode value).
		aStream nextPutAll: (self printArray: aNode value).
		aStream nextPutAll: ';';cr.
		 ]
	ifFalse: [ 
		aStream nextPutAll: 'const double ', aNode symbol asString, ' = ', aNode value asFloat asString, ';';cr.
		 ].	
	"Another case: aNode value is nil and aNode expression is an Expression"
	^ aStream contents