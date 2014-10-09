tests
createSEIREbolaModel
	|model population graph |
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 6.
	population forEachSubPopulation: [ :node|
		node compartments: #(S E I H F R).
		node 
			at: #S put: 1000; 
			at: #E put: 0; 
			at: #I put: 0; 
			at: #R put: 0; 
			at: #H put: 0; 
			at: #F put: 0
		 ].
	(population at: 1) at: #S put: 950; at: #I put: 50.
	graph := KEGraph on: population.
	graph edges: #all moveRates: 0.05.
	model population: population.
	model addParameter: #betaI value: 0.00013.
	model addParameter: #betaH value: 0.0001.
	model addParameter: #betaF value: 0.00055.
	model addParameter: #theta1 value: 0.67.
	model addParameter: #delta1 value: 0.54.
	model addParameter: #delta2 value: 0.53.
	model addParameter: #gammaH value: 0.2.
	model addParameter: #gammaDH value: 0.22.
	model addParameter: #gammaI value: 0.1.
	model addParameter: #gammaIH value: 0.2.
	model addParameter: #gammaF value: 0.5.
	model addParameter: #gammaD value: 0.104.
	model addParameter: #anpha value: 0.14.	
	
	model addEquation: ('S:t=-betaI*S*I-betaH*S*H-betaF*S*F' parseAsAnEquation).
	model addEquation: ('E:t=betaI*S*I+betaH*S*H+betaF*S*F-anpha*E' parseAsAnEquation).
	model addEquation: ('I:t=anpha*E-gammaH*theta1*I-delta1*(1-theta1)*gammaD*I-gammaI*(1-theta1)*(1-delta1)*I' parseAsAnEquation).
	model addEquation: ('H:t=gammaH*theta1*I-gammaDH*delta2*H-gammaIH*(1-delta2)*H' parseAsAnEquation).
	model addEquation: ('F:t=gammaDH*delta2*H-gammaF*F+delta1*(1-theta1)*gammaD*I' parseAsAnEquation).
	model addEquation: ('R:t=gammaIH*(1-delta2)*H+gammaI*(1-theta1)*(1-delta1)*I+gammaF*F' parseAsAnEquation).
	
	^ model
	
