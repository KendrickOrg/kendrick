initialization
initialize
	super initialize.
	t := 0.
	self addParameter: #N value: [ :aModel| aModel population size].
	self addParameter: #t value: [ :aModel| aModel t ].
	concerns := OrderedCollection new
	