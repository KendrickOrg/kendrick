protected
addParameter: variable value: value

	value isNumber 
		ifTrue: [backEndEntity addParameter: variable value: value]
		ifFalse: [ "array" 
			backEndEntity 
				addParameter: variable 
				value: (self covertSymbolicExpressionToBlock: value).
		]