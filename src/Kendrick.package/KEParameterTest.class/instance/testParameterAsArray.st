tests
testParameterAsArray 
	|model population dsdt|
	model := KEModel new.
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population subPopulations do: [ :each| each compartments: #(S I R) ].
	(population at: 1) at: #S put: 9999; at: #I put: 1; at: #R put: 0.
	(population at: 2) at: #S put: 1000; at: #I put: 0; at: #R put: 0.
	(population at: 3) at: #S put: 2000; at: #I put: 0; at: #R put: 0.
	model population: population.
	model addParameter: #beta value: #(#(0 0.02 0.02) #(0.02 0.0 0.0)  #(0.02 0.0 0.0)). 
	model addParameter: #i value: (1 to: 3).
	model addParameter: #j value: (1 to: 3).
	model addParameter: #d value: 5.
	dsdt := 'S[i]:t=-sum(j, beta[i][j]*I[j])*S[i]' parseAsAnEquation.
	model addEquation: dsdt.
	model addTemporalParameter: #i value: 1.
	model addTemporalParameter: #PID value: #(0 1).
	self assert: (dsdt expression evaluateWithModel: model) equals: 0.

