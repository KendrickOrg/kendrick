printing
printOn: arg1
	| tmp1 tmp2 tmp4 |
	tmp1 := from isSymbol
		ifTrue: [ from asString ]
		ifFalse: [ from associations asString ].
	tmp2 := to isSymbol
		ifTrue: [ to asString ]
		ifFalse: [ to associations asString ].
	tmp4 := arg1.
	tmp4
		nextPutAll: 'From: ';
		nextPutAll: tmp1;
		nextPutAll: ' To: ';
		nextPutAll: tmp2