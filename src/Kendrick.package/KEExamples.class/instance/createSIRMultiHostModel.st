tests
createSIRMultiHostModel
	|model population|
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population forEachSubPopulation: [ :each| each compartments: #(S I R) ].
	(population at: 1) at: #S put: 9999; at: #I put: 1; at: #R put: 0.
	(population at: 2) at: #S put: 999; at: #I put: 1; at: #R put: 0.
	(population at: 3) at: #S put: 1999; at: #I put: 1; at: #R put: 0.
	model population: population.
	
	model addParameter: #beta value: #(#(0.0 0.02 0.02) #(0.02 0.0 0.0) #(0.02 0.0 0.0)).
	model addParameter: #N value: #(10000 1000 2000).
	model addParameter: #mu value: {365/30 . 1/20 . 1/20}.
	model addParameter: #v value: 52.
	model addParameter: #i value: (1 to: 3).
	model addParameter: #j value: (1 to: 3).
	
	model addEquation: ('S[i]:t=mu[i]*N[i]-sum(j, beta[i][j]*I[j])*S[i]-mu[i]*S[i]' parseAsAnEquation).
	model addEquation: ('I[i]:t=sum(j, beta[i][j]*I[j])*S[i]-(mu[i]+v)*I[i]' parseAsAnEquation).
	model addEquation: ('R[i]:t=v*I[i]-mu[i]*R[i]' parseAsAnEquation).
	
	^ model
	
