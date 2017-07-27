accessing
atNode: arg1
	^ self nodes detect: [ :arg2 | arg2 label = arg1 ]