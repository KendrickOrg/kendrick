accessing
nodes: arg1
	| tmp1 |
	tmp1 := super new.
	arg1 isNumber
		ifTrue: [ 1 to: arg1 do: [ :tmp2 | tmp1 addNode: tmp2 asString asSymbol ] ].
	arg1 isArray
		ifTrue: [ arg1 do: [ :arg2 | tmp1 addNode: arg2 ] ].
	^ tmp1