tests
createSIRMultiHostModel
	|model|
	model := KEModel2 new.
	model population nodes: 3.
	(model population at: 1) compartments: #((S 9999) (I 1)).
	(model population at: 2) compartments: #((S 1000) (I 0)).
	(model population at: 3) compartments: #((S 2000) (I 0)). 
	
	model addParameter: #beta value: #(#(0 0.02 0.02) #(0.02 0.0 0.0) #(0.02 0.0 0.0)).
	model addParameter: #N value: #(10000 1000 2000).
	model addParameter: #mu value: {365/30 . 1/20 . 1/20}.
	model addParameter: #v value: 52.
	model addParameter: #i value: (1 to: 3).
	model addParameter: #j value: (1 to: 3).
	
	model addEquation: ('S[i]:t=mu[i]*N[i]-sum(j, beta[i][j]*I[j])*S[i]-mu[i]*S[i]' parseAsAnEquation).
	model addEquation: ('I[i]:t=sum(j, beta[i][j]*I[j])*S[i]-(mu[i]+v)*I[i]' parseAsAnEquation).
	
	^ model
	
