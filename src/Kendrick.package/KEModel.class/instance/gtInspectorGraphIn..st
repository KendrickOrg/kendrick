as yet unclassified
gtInspectorGraphIn: composite
	<gtInspectorPresentationOrder: 30>
	composite list
		title: 'Box View';
		display: [ 
					| builder nodes |
					nodes := OrderedCollection new.
					builder := RTGraphBuilder new.
					
					"Collect all nodes of the graph"
					self population compartments do: [ :each | nodes add: each].
					builder edges
					]