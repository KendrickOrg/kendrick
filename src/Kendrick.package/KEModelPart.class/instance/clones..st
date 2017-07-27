general
clones: arg1
	self transitions: arg1 transitions.
	attributes := Dictionary new.
	arg1 attributes
		keysAndValuesDo: [ :arg2 :arg3 | attributes at: arg2 put: arg3 ].
	parameters := Dictionary new.
	arg1 parameters
		keysAndValuesDo: [ :arg4 :arg5 | parameters at: arg4 put: arg5 ]