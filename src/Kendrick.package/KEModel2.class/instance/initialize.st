as yet unclassified
initialize
	super initialize.
	parameters := Dictionary new.
	temporalParameters := Dictionary new.
	equations := OrderedCollection new.
	population := KEPopulation new.
	populationBuilder := KEPopulationBuilder new.
	
	"by default, the inter-pop interaction of model is represented on equation system, it it is represented on network the value must be set as 'network'"
	self addParameter: #InterPopInteractionOn value: 'equation'.
