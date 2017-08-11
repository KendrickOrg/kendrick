examples
example2
	| v g n nodes edges nbNodes |
	n := KEContactNetworkSimulator
		fromNetwork:
			(KEKleinbergContactNetwork new
				nodes: (1 to: 25 * 25);
				n: 25;
				p: 1;
				q: 1;
				r: 2).
	g := n network.
	10 timesRepeat: [ n step ].
	v := RTView new.
	nbNodes := g n.
	nodes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: g nodes.
	nodes := (RTEllipse new
		color: [ :e | 
			e currentStatus == #I
				ifTrue: [ Color red ]
				ifFalse: [ e currentStatus == #S
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ] ];
		size: 10) elementsOn: g nodes.
	nodes @ RTDraggable.
	v addAll: nodes.
	edges := RTEdgeBuilder new
		view: v;
		shape: (RTLine new color: (Color red alpha: 0.5));
		source: g edges connectFrom: #from to: #to.
	edges do: [ :e | e trachelShape pushBack ].
	RTGridLayout new
		lineItemsCount: nbNodes;
		on: v elements.
	v canvas addMenu: '+' callback: [ RTZoomInMove on: v ].
	v canvas addMenu: '-' callback: [ RTZoomOutMove on: v ].
	v canvas camera scale: 2.
	v @ RTDraggableView @ RTZoomableView.
	v open