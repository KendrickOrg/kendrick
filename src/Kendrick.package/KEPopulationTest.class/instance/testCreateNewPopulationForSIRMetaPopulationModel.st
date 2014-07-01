as yet unclassified
testCreateNewPopulationForSIRMetaPopulationModel
	|population|
	population := KEPopulation new.
	population nodes: 3.
	population graph nodes: 3 edges: #((1 2) (1 3)) weight: #beta values: 0.02.
	(population nodes at: 1) compartments: #((S 9999) (I 1) (R 0)).
	(population nodes at: 2) compartments: #((S 1000) (I 0) (R 0)).
	(population nodes at: 3) compartments: #((S 2000) (I 0) (R 0)).
	population with: #mu value: { 365/30 . 1/20 . 1/20 }.
	population with: #N value: { 10000 . 1000 . 2000 }.
 
	self assert: (population at: #(0 1)) isAPopulationOfCompartments equals: true.
	self assert: ((population at: #(0 1)) atParameter: #mu) value equals: 365/30.
	self assert: ((population at: #(0 2)) atParameter: #N) value equals: 1000. 