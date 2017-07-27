as yet unclassified
entityExistsIn: arg1
	| tmp1 tmp2 |
	arg1 exists
		ifTrue: [ tmp1 := arg1 readStream.
			tmp2 := Compiler evaluate: tmp1 upToEnd.
			tmp1 close.
			^ tmp2 ].
	NotFoundError signal: 'NO such entity: ' , arg1 asString