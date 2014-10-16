tests
testGenerateEventsOfMultiHostsModel
	|model eventGenerator population  dsdt didt|
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population forEachSubPopulation: [ :each| each compartments: #(S I R) ].
	(population at: 1) at: #S put: 9999; at: #I put: 1; at: #R put: 0.
	(population at: 2) at: #S put: 999; at: #I put: 1; at: #R put: 0.
	(population at: 3) at: #S put: 1999; at: #I put: 1; at: #R put: 0.
	model population: population.
	
	dsdt := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i][j]*I[j])*S[i]-mu[i]*S[i]' parseAsAnEquation.
	didt := 'I[i]:t=sum(j, beta[i][j]*I[j])*S[i]-(mu[i]+v)*I[i]' parseAsAnEquation.
	model addEquation: dsdt.
	model addEquation: didt.
	
	eventGenerator := KEEventGenerator new.
	eventGenerator generateEvents: model.
	self assert: ((model population at: 1) events size) equals: 4.
	self assert: ((model population at: 2) events size) equals: 4.
	self assert: ((model population at: 3) events size) equals: 4.