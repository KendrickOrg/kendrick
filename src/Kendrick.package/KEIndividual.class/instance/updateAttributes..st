as yet unclassified
updateAttributes: arg1
	arg1
		keysAndValuesDo: [ :arg2 :arg3 | self attributes at: arg2 put: arg3 ]