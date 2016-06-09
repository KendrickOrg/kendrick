initialization
initialize
	super initialize.
	t := 0.
	"add default value for parameters"
	self addParameter: #N value: [ :aModel| aModel sizeOfPopulation ].
	self addParameter: #t value: [ :aModel| aModel t ].
	population := KEPopulation new.
	concerns := OrderedCollection new.
	