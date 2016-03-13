printing
printOn: aStream
	| f t |
	f := from isSymbol
		ifTrue: [ from asString ]
		ifFalse: [ from associations asString ].
	t := to isSymbol
		ifTrue: [ to asString ]
		ifFalse: [ to associations asString ].
	aStream
		nextPutAll: 'From: ';
		nextPutAll: f;
		nextPutAll: ' To: ';
		nextPutAll: t