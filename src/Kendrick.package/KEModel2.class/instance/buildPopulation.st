as yet unclassified
buildPopulation
	"This function is called after all modifications of compartments by users"
	population := KEPopulation new.
	populationBuilder build: population from: compartments
	