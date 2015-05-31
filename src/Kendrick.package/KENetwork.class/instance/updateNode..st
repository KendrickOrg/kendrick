as yet unclassified
updateNode: ind
	networkOfIndividuals ifTrue: [ 
		|oldStt newStt|
		oldStt := ind currentStatus at: #status.
		newStt := ind nextStatus at: #status.
		(self nodes at: (ind id)) adjacentNodes keysDo: [ :i| 
			(self nodes at: i) atContact: oldStt remove: 1.
			(self nodes at: i) atContact: newStt add: 1
		]	
	]
