protected
addParameter: arg1 value: arg2
	arg2 isNumber
		ifTrue: [ backEndEntity addParameter: arg1 value: arg2 ]
		ifFalse: [ backEndEntity
				addParameter: arg1
				value: (self covertSymbolicExpressionToBlock: arg2) ]