private
assignValue: aValue ForIndexVariable: funcExp
	|tmp str1 str2 modifiedStr result|
	tmp := funcExp  asString.
	str1  := '[' , idVariable symbol , ']'.
	str2 := '[' , aValue asString , ']'.
	modifiedStr  := tmp copyReplaceAll: str1 with: str2 asTokens: false.
	result := modifiedStr parseAsAnExpression.
	^result.