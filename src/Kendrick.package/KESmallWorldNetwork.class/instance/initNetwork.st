as yet unclassified
initNetwork
	super initNetwork.
	"Make rndContact random contact in lattice grid"
	self makeRndContacts.
	(self networkOfIndividuals) ifTrue: [ self initContacts ]
	