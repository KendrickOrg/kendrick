tests
createSEIRMeaslesModelwithVaccination
	|model|
	model := KEModel new.
	model population compartments: #((S 99999) (E 0) (I 1) (R 0)).
	
	model addParameter: #beta value: 0.00782.
	model addParameter: #gamma value: 52.14.
	model addParameter: #mu value: 0.0128.
	model addParameter: #sigma value: 45.625.
	model addParameter: #N value: 100000.
	model addParameter: #p value: 0.7.
	
	model addEquation: ('S:t=mu*N*(1-p)-beta*S*I-mu*S' parseAsAnEquation).
	model addEquation: ('E:t=beta*S*I-sigma*E-mu*E' parseAsAnEquation).
	model addEquation: ('I:t=sigma*E-gamma*I-mu*I' parseAsAnEquation).
	model addEquation: ('R:t=mu*N*p+gamma*I-mu*R' parseAsAnEquation).
	
	^ model
	
