as yet unclassified
printArray: arg1
	| tmp1 tmp3 |
	tmp1 := WriteStream on: (String new: 60).
	tmp1 nextPutAll: '{'.
	tmp3 := 0.
	arg1
		do: [ :arg2 | 
			tmp3 := tmp3 + 1.
			arg2 isArray
				ifTrue: [ tmp1 nextPutAll: (self printArray: arg2) ]
				ifFalse: [ tmp1 nextPutAll: arg2 asFloat asString ].
			tmp3 = arg1 size
				ifFalse: [ tmp1 nextPutAll: ', ' ] ].
	tmp1 nextPutAll: '}'.
	^ tmp1 contents