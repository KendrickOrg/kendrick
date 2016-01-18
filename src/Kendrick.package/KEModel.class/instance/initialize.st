initialization
initialize
	super initialize.
	parameters := Dictionary new.
	t := 0.
	"add default value for parameters"
	self addParameter: #N value: [ :aModel| aModel sizeOfPopulation ].
	self addParameter: #t value: [ :aModel| aModel t ].
	attributes := Dictionary new.
	equations := OrderedCollection new.
	population := KEPopulation new.
	transitions := OrderedCollection new.

	