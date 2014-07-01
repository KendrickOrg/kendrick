behavior
changeStatus
	|ind model pop old next|
	ind := self arguments at: #ind.
	model := self arguments at: #model.
	pop := model population at: (model getPID).
	old := ind currentStatus.
	next := ind nextStatus.
	ind currentStatus: next.
	ind nextStatus: nil.
	(pop at: old) removeIndividual: 1.
	(pop at: next) addIndividual: 1.
	"update contact number in network"
	pop hasGraph ifTrue: [ 
		(pop graph nodes at: (ind id)) adjacentNodes do: [ :i| 
			(pop graph nodes at: i) at: old remove: 1.
			(pop graph nodes at: i) at: next add: 1
			]
		].
	^ true
	