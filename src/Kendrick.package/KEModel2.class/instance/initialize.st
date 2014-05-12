as yet unclassified
initialize
	super initialize.
	parameters := Dictionary new.
	temporalParameters := Dictionary new.
	equations := OrderedCollection new.
	"populationBuilder := KEPopulationBuilder new.
	population := populationBuilder population."
	population := KEPopulation new.
	compartmentSymbols := Dictionary new.
	"compartments is a temporal variable as a dictionary: #S-->aKECompartment or #S-->anArray of compartments with the same name (S)"
	compartments := Dictionary new.
