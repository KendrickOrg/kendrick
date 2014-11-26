tests
viewGraph
	|population graph b|
population := KEMetaPopulation new.
population numberOfSubPopulations: 3.
population forEachSubPopulation: [ :each| 
	each compartments: #(S I R). 
	each at: #S put: 1000; at: #I put: 10; at: #R put: 0
	].
graph := KEGraph on: population.
graph edges: #((1 2) (1 3)) weight: #beta values: 0.02.
 
b := RTGraphBuilder new.
b nodes
	shape: (RTEllipse new size: 20) + RTLabel;
	color: Color gray.
b edges
	connectTo: [ :c| c adjacentNodes collect: [:i| graph nodes at: i] ];
	useInLayout.
b layout forceCharge: -200.
b global
	colorCycles.
b addAll: graph nodes.
b open.
b view canvas a TRCanvas