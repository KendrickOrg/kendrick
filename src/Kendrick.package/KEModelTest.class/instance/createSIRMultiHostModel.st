tests
createSIRMultiHostModel
	|model|
	model := KEModel2 new.
	model addCompartment: #S numberOfIndividuals: #(9999 1000 2000).
	model addCompartment: #I numberOfIndividuals: #(1 0 0).
	
	model addParameter: #beta value: #(#(0 0.02 0.02) #(0.02 0.0 0.0) #(0.02 0.0 0.0)).
	model addParameter: #N value: #(10000 1000 2000).
	model addParameter: #mu value: {365/30 . 1/20 . 1/20}.
	model addParameter: #v value: 52.
	model addParameter: #i value: (1 to: 3).
	model addParameter: #j value: (1 to: 3).
	
	model addEquation: ('S[i]:t=mu[i]*N[i]-sum(j, beta[i][j]*I[j])*S[i]-mu[i]*S[i]' parseAsAnEquation).
	model addEquation: ('I[i]:t=sum(j, beta[i][j]*I[j])*S[i]-(mu[i]+v)*I[i]' parseAsAnEquation).
	
	^ model
	
