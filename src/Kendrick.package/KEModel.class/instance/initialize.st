initialization
initialize
	super initialize.
	t := 0.
	self
		addParameter: #N value: [ :arg1 | arg1 population size ];
		addParameter: #t value: [ :arg2 | arg2 t ].
	concerns := OrderedCollection new