grammar
getObjectArrayOf: arg1 at: arg2
	| tmp1 |
	tmp1 := OrderedCollection new.
	arg1 do: [ :arg3 | tmp1 addLast: (arg3 at: arg2) parsedValue ].
	^ tmp1