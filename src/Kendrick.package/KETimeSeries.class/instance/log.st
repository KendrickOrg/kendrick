accessing
log
	^ self class
		from: (data collect: [ :arg1 | arg1 perform: #log ])
		withIndex: index copy
		compartment: self compartment