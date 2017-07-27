as yet unclassified
checkIndexedExpression: arg1
	arg1
		do: [ :arg2 | 
			arg2 class = KEVariable
				ifTrue: [ ^ true ] ].
	^ false