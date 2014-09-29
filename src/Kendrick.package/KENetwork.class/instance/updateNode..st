as yet unclassified
updateNode: ind
	|oldStt newStt|
	oldStt := ind currentStatus.
	newStt := ind nextStatus.
	(self nodes at: (ind id)) adjacentNodes do: [ :i| 
		(self nodes at: i) at: oldStt remove: 1.
		(self nodes at: i) at: newStt add: 1
		]
