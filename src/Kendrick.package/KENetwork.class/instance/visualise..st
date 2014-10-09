accessing
visualise: aPopulation
	|b|
	b := RTGraphBuilder new.
	b nodes
	shape: (RTEllipse new size: 20) + RTLabel;
	if: [ :c| c name = #S ];
	color: (Color blue alpha: 0.5).
	b nodes
		shape: (RTEllipse new size: 20) + RTLabel;
		if: [ :c| c name = #I ];
		color: (Color red alpha: 0.5).
	b nodes
		shape: (RTEllipse new size: 20) + RTLabel;
		if: [ :c| c name = #R ];
		color: (Color green alpha: 0.5).
	b edges
		connectTo: [ :c| c adjacentNodes collect: [ :i| population graph nodes at: i ] ];
		useInLayout.
	b layout use: (RTCircleLayout new initialRadius: 270).
	b addAll: population graph nodes.
   b open.
   b view canvas