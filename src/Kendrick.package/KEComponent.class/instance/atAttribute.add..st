accessing
atAttribute: arg1 add: arg2
	| tmp1 |
	attributes
		at: arg1
		ifAbsent: [ ^ self error: 'Cannot find attribute ' , arg1 asString ].
	tmp1 := OrderedCollection new.
	tmp1
		addAll: (attributes at: arg1);
		add: arg2.
	attributes at: arg1 put: tmp1