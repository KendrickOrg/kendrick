examples
exampleHexagon1
	| v g n nodes edges nbNodes |
	n := KEContactNetworkSimulator
		fromNetwork:
			(KEHexagonalContactNetwork new
				nodes: (1 to: 25 * 25);
				n: 25;
				m: 25).
	g := n network.
	10 timesRepeat: [ n step ].
	v := RTView new.
	nbNodes := g n.
	nodes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: g activeNodes.
	nodes := (RTEllipse new
		color: [ :e | 
			e currentStatus == #I
				ifTrue: [ Color red ]
				ifFalse: [ e currentStatus == #S
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ] ];
		size: 10) elementsOn: g activeNodes.
	nodes @ RTDraggable.
	v addAll: nodes.
	edges := RTEdgeBuilder new
		view: v;
		shape: (RTLine new color: (Color red alpha: 0.5));
		source: g edges connectFrom: #from to: #to.
	edges do: [ :e | e trachelShape pushBack ].
	v addAnimation: (RTSpringLayoutStepping new view: v).
	v @ RTDraggableView.
	v open