mathematical functions
sqrt
	^ self class
		from: (data collect: [ :arg1 | arg1 perform: #sqrt ])
		withIndex: index copy
		compartment: self compartment