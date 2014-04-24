as yet unclassified
with: subPopulations
	self new.
	subPopulations isCollection
	ifTrue: [ self addAllSubPopulations: subPopulations ]
	ifFalse: [ self addSubPopulation: subPopulations ]