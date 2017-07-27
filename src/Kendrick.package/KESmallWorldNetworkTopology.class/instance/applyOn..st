accessing
applyOn: arg1
	| tmp1 |
	activeNodes := OrderedCollection new.
	tmp1 := arg1 nodes size.
	1 to: tmp1 do: [ :tmp2 | self appendNode: tmp2 -> arg1 ]