as yet unclassified
getFileName: arg1
	| tmp1 |
	tmp1 := WriteStream on: (String new: 10).
	arg1 compartments
		do: [ :arg2 | tmp1 nextPutAll: arg2 status asString ].
	tmp1 nextPutAll: '.cpp'.
	^ tmp1 contents