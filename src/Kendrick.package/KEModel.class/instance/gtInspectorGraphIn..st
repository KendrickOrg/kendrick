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
					builder shape circle size: 20.
					builder nodes: graph nodes.
					builder shape arrowedLine color: Color black; withShorterDistanceAttachPoint.
					builder edges
						objects: graph edges.
					builder layout forceWithCharge: -450.
					builder build.
					]