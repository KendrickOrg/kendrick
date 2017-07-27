protected
integrate: arg1
	backEndEntity integrate: arg1 keConcern.
	parameters addAll: arg1 parameters.
	arg1 parameters
		keysAndValuesDo: [ :arg2 :arg3 | self addParameter: arg2 value: arg3 ].
	attributes addAll: arg1 attributes