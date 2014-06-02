as yet unclassified
printOn: aStream
	aStream nextPutAll: (attributes at: #currentStatus) asString, '-->', (attributes at: #nextStatus ifAbsent: [nil]) asString
