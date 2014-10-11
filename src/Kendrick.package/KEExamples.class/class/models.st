as yet unclassified
models
     |model  |   
	
	ModelExample := OrderedCollection new.

   model := KEModel new.
	model population compartments: #(S I R).
	model population at: #S put: 99; at: #I put: 1; at: #R put: 0.
	
	model addParameter: #beta value: 0.01.
	model addParameter: #gamma value: 0.1.
	
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	
	ModelExample add: model.
	
	model := KEModel new.
	model population compartments: #(S E I R).
	model population at: #S put: 99999; at: #E put: 0; at: #I put: 1; at: #R put: 0.
	
	model addParameter: #beta value: 0.0052.
	model addParameter: #gamma value: 365/7.
	model addParameter: #sigma value: 365 / 7.
	model addParameter: #mu value: 1 / 80.
	model addParameter: #N value: 100000.
	
	model addEquation: ('S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation).
	model addEquation: ('E:t=beta*S*I-sigma*E-mu*E' parseAsAnEquation).
	model addEquation: ('I:t=sigma*E-gamma*I-mu*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I-mu*R' parseAsAnEquation).
	
	ModelExample add: model.
	
      ^ModelExample