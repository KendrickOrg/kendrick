as yet unclassified
gtInspectorGraphIn: composite
	<gtInspectorPresentationOrder: 30>
	composite list
		title: 'Box View';
		display: [ 
					| builder graph |
					builder := RTGraphBuilder new.
					graph := (KEGraphFromCompartments on: self) run.
					builder nodes shape:(RTEllipse new size: 20) + RTLabel.
					builder edges
						seed: graph edges;
						connectFrom: #from;
						connectTo: #to;
						useInLayout.
					builder layout forceCharge: -350.
					builder addAll: graph nodes.
					builder view]