examples
example2
	| v g s nodes edges nbNodes |
	s := KEContactNetworkSimulator new.
	g := s network.
	10 timesRepeat: [ s step ].
	v := RTView new.
	nbNodes := 20.
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