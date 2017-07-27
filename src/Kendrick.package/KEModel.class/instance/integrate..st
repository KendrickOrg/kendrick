accessing
integrate: arg1
	concerns add: arg1.
	self transitions: (arg1 generateTensorSum: self transitions).
	arg1 attributes
		keysAndValuesDo: [ :arg2 :arg3 | self addAttribute: arg2 value: arg3 ].
	arg1 parameters
		keysAndValuesDo: [ :arg4 :arg5 | self addParameter: arg4 value: arg5 ].
	self population reset.
	initCompartments := nil