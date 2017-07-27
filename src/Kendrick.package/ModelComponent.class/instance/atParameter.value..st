protected
atParameter: arg1 value: arg2
	arg2 isNumber
		ifTrue: [ backEndEntity atParameter: arg1 assignValue: arg2 ]
		ifFalse: [ backEndEntity
				atParameter: arg1
				assignValue: (self covertSymbolicExpressionToBlock: arg2) ]