protected
atParameter: variable value: value

	value isNumber 
		ifTrue: [backEndEntity atParameter: variable assignValue: value]
		ifFalse: [ "array" 
			backEndEntity 
				atParameter: variable 
				assignValue: (self covertSymbolicExpressionToBlock: value).
		]