as yet unclassified
updateStatusOld: population
	|next old|
	next := self nextStatus.
	old := self currentStatus.
	next = #empty 
	ifTrue: [ 
		(population graph hasNetwork) ifTrue: [ population graph releaseRoom: (self id) ].
		(population at: old) removeIndividual: 1. 
		 ]
	ifFalse: [ 
		self currentStatus: next.
		self nextStatus: nil.
		(population at: old) removeIndividual: 1.
		(population at: next) addIndividual: 1.
		(population graph hasNetwork) ifTrue: [ 
			(population graph nodes at: (self id)) adjacentNodes do: [ :i|
				(population graph nodes at: i) at: old remove: 1.
				(population graph nodes at: i) at: next add: 1.
			 ]
		 ]
	 ]
	
	