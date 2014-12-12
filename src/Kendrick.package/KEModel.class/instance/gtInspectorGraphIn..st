as yet unclassified
gtInspectorGraphIn: composite
	<gtInspectorPresentationOrder: 30>
	composite roassal2
		title: 'View';
		painting: [ :view|
					| builder graph |
					builder := RTGraphBuilder new.
					builder view: view.
					graph := (KEGraphFromCompartments on: self) run.
					builder nodes shape:(RTEllipse new size: 20) + RTLabel.
					builder edges
						seed: graph edges;
						connectFrom: #from;
						connectTo: #to;
						useInLayout.
					builder layout forceCharge: -350.
					builder addAll: graph nodes.
					]