as yet unclassified
initialize
	super initialize.
	parameters := Dictionary new.
	equations := OrderedCollection new.
	population := KEPopulation new.
	transitions := OrderedCollection new.
	forceOfInfections := OrderedCollection new.
	