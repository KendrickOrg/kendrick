as yet unclassified
sumAll: arg1
	arg1 isNumber
		ifTrue: [ ^ arg1 ].
	arg1 isArray
		ifTrue: [ ^ (arg1 collect: [ :arg2 | self sumAll: arg2 ]) sum ]