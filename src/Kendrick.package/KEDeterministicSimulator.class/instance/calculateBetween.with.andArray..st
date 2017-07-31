private
calculateBetween: m with: n andArray: p
	| api temp1 temp2 temp result|
	api := KEBinaryExpression new.
	api op: #*.
	temp1 := m.
	temp2 := n.
	temp1 isArray ifFalse: [ temp1 := api convertToAnArray: temp1 inFormat: p ].
	temp2 isArray ifFalse: [ temp2 := api convertToAnArray: temp2 inFormat: p ].
	temp := api calculateArraysBetween: temp1 with: temp2.
	result := api calculateArraysBetween: temp with: p.
	^result.
	