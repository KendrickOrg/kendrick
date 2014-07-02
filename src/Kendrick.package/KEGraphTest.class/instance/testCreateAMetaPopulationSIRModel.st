as yet unclassified
testCreateAMetaPopulationSIRModel
	|model|
	model := KEModel new.
	model population nodes: 3. 
	model population graph nodes: 3 edges: #((1 2) (1 3)) weight: #beta values: 0.02.
	(model population nodes at: 1) compartments: #((S 9999) (I 1) (R 0)).
	(model population nodes at: 2) compartments: #((S 1000) (I 0) (R 0)).
	(model population nodes at: 3) compartments: #((S 2000) (I 0) (R 0)).
	
	self assert: model population graph nodes size equals: 3.
	self assert: ((model population graph nodes at: 1) weight: #beta of: 2) equals: 0.02. 
	self assert: ((model population graph nodes at: 2) weight: #beta of: 2) equals: 0. 
	self assert: ((model population graph nodes at: 2) weight: #beta of: 1) equals: 0.02. 