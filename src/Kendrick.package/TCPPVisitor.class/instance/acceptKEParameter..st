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
		aStream nextPutAll: 'const double ', aNode symbol asString, ' = ',
			"ThanhNT 7/7"
			"The old statement can not be executed while I run "
			"testSIRModel of TCPPStochasticVisitorTest"
			"The problem is asFloat"
			 "aNode value asFloat asString, ';';cr."
			"aNode value asString, ';';cr."
			(aNode value: (self model)) asString, ';';cr.
			"Endof ThanhNT 7/7"
		 ].	
	"Another case: aNode value is nil and aNode expression is an Expression"
	^ aStream contents