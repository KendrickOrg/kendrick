as yet unclassified
contactsOf: arg1
	| tmp1 tmp2 tmp3 tmp4 |
	tmp1 := arg1 first.
	tmp3 := Dictionary newFrom: (arg1 copyFrom: 2 to: arg1 size).
	tmp2 := tmp3 at: #node.
	tmp3 removeKey: #node.
	tmp4 := OrderedCollection new.
	tmp4
		add: tmp1;
		addAll: tmp3 associations.
	^ (self atNode: tmp2) contactsOf: tmp4