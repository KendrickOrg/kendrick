as yet unclassified
printOn: aStream
	aStream nextPutAll: (adjacentNodes asArray asString), '-->'.
	weights keysAndValuesDo: [ :key :value|
		aStream nextPutAll: key asString, ':', value asArray asString, ' '
		 ]