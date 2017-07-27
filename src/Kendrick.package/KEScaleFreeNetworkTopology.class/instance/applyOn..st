instance creation
applyOn: arg1
	| tmp1 |
	activeNodes add: arg1 nodes first label.
	tmp1 := m0 + 1.
	2 to: tmp1 do: [ :tmp2 | 
		activeNodes add: (arg1 nodes at: tmp2) label.
		arg1
			edgesFrom: arg1 nodes first label
			toAll: (Array with: (arg1 nodes at: tmp2) label) ].
	tmp1 := arg1 nodes size.
	m0 + 2 to: tmp1 do: [ :tmp2 | self appendNode: (arg1 nodes at: tmp2) label -> arg1 ]