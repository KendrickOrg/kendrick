printing
getParameter: arg1
	| tmp1 |
	tmp1 := arg1 at: symbol ifAbsent: [ ^ nil ].
	tmp1 ifNil: [ ^ nil ].
	tmp1 ifNotNil: [ ^ tmp1 symbol ]