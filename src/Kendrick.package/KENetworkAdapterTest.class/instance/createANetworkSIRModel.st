as yet unclassified
createANetworkSIRModel
	|model population|
	model := KEModel new.
	population := KEMetaPopulation new.
	population compartments: #(S I R).
	population at: #S put: 90; at: #I put: 1; at: #R put: 0.
	KENetwork new: #lattice numberOfContacts: 4 onPopulation: population.
	model population: population.
	
	model addEquation: 'S:t=-beta*S*I' parseAsAnEquation.
	model addEquation: 'I:t=beta*S*I - gamma*I' parseAsAnEquation.
	model addEquation: 'R:t=gamma*I' parseAsAnEquation.
	model addParameter: #beta value: 0.01.
	model addParameter: #gamma value: 0.2.
	
	^ model 