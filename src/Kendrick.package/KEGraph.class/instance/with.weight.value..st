as yet unclassified
with: edge weight: aSymbol value: weight
	|index1 index2 labels|
	labels := nodes collect: [ :e| e label ].
	index1 := labels indexOf: (edge at: 1).
	index2 := labels indexOf: (edge at: 2).
	(nodes at: index1) with: (edge at: 2) weight: aSymbol value: weight.
	(nodes at: index2) with: (edge at: 1) weight: aSymbol value: weight