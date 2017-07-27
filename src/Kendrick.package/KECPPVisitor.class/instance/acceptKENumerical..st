as yet unclassified
acceptKENumerical: arg1
	| tmp1 |
	tmp1 := WriteStream on: (String new: 60).
	tmp1 nextPutAll: arg1 number asString.
	^ tmp1 contents