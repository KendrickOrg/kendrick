tests
testCreateNewPopulationForSIRMetaPopulationModel
	|population|
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	"population graph edges: #((1 2) (1 3)) weight: #beta values: 0.02."
	population forEachSubPopulation: [ :each| each compartments: #(S I R) ].
	(population at: 1) at: #S put: 9999; at: #I put: 1; at: #R put: 0.
	(population at: 2) at: #S put: 1000; at: #I put: 0; at: #R put: 0.
	(population at: 3) at: #S put: 2000; at: #I put: 0; at: #R put: 0.
	population addParameter: #mu value: { 365/30 . 1/20 . 1/20 }.
	population addParameter: #N value: { 10000 . 1000 . 2000 }.
 
	self assert: (population at: 1) isPopulation equals: true.
	self assert: ((population at: 1) atParameter: #mu) value equals: 365/30.
	self assert: ((population at: 2) atParameter: #N) value equals: 1000. 