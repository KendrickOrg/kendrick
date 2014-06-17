tests
createSIRMetaPopulationWithMovementModel1
	|model|
	model := KEModel new.
	model population nodes: 5 forEach: [ :node|
		node compartments: #((S 1000) (I 10))
		 ].
	(model population nodes at: 1) compartments: #((S 1000) (I 1)).
	"model population compartments: #((S 996) (I 4))."
	"movement rate between sub-populations"
	model population edges: #all weight: #m values: 0.001.
   model addParameter: #mu value: 0.0001.
	model addParameter: #beta value: 0.0001.
	model addParameter: #gamma value: 0.1.
	model addParameter: #N value: 10000.
	model addEquation: ('S:t=mu*N - beta*S*I - mu*S' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I - gamma*I - mu*I' parseAsAnEquation).
	
	^ model  
	
	
	
	
	
