as yet unclassified
visualise: population
	"Show the graph with RTGraphBuilder of Roassal2"
	|b|
	b := RTGraphBuilder new.
	b nodes
		shape: (RTEllipse new size: 20) + RTLabel;
		color: (Color blue alpha: 0.4);
		whenClicked: [ :n| 
			(population at: (n name)) graph ifNotNil: [ 
				(population at: (n name)) graph visualise: (population at: (n name)) ]
			 ].
	b edges
		connectTo: [ :c| c adjacentNodes collect: [:i| self nodes at: i] ];
		useInLayout.
	b layout use: (RTCircleLayout new initialRadius: 100).
	b addAll: self nodes. 
	b open.
	b view canvas