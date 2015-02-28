as yet unclassified
visualise
	"Show the graph with RTGraphBuilder of Roassal2"
	|b|
	"b := RTGraphBuilder new.
	b nodes
		shape: (RTEllipse new size: 20) + RTLabel;
		color: (Color blue alpha: 0.4);
		whenClicked: [ :n| 
			(population at: (n label)) graph ifNotNil: [ 
				(population at: (n label)) graph visualise: (population at: (n label)) ]
			 ].
	b edges
		connectTo: [ :c| c adjacentNodes collect: [:i| self nodes at: i] ];
		useInLayout.
	b layout use: (RTCircleLayout new initialRadius: 100).
	b addAll: self nodes. 
	b open.
	b view canvas"
	b := RTMondrian new.
	b shape circle.
	b nodes: self nodes.
	b shape line color: (Color gray alpha: 0.2).
	b edges connectFrom: [ :c| c adjacentNodes collect: [ :i| self nodes at: i ] ];
		useInLayout.
	b layout force.
	b build.
	b view