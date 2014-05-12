as yet unclassified
testRunDeterministicForMetaPopulationModel
	|model|
	model := KEModel2 new.
	model addCompartment: #S numberOfIndividuals: #(9999 1000 2000).
	model addCompartment: #I numberOfIndividuals: #(1 0 0).
	model buildPopulation.

	
	