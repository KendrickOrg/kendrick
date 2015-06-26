as yet unclassified
gtInspectorGraphIn: composite
	<gtInspectorPresentationOrder: 30>
	composite roassal2
		title: 'View';
		painting: [ :view|
					| builder graph |
					builder := RTMondrian new.
					builder view: view.
					graph := (KEGraphFromCompartments on: self) run.
					builder shape ellipse size:20.
					builder edges
						objects: graph edges;
						connectFrom: #from;
						connectTo: #to.
					builder layout forceWithCharge: -350.
					builder nodes: graph nodes.
					]