as yet unclassified
transitions
	equations size > 0 ifTrue: [ self equationsToTransitions ].
	transitions size = 0 ifTrue: [  
		"generate a transition rate matrix of 0"
		self compartmentNames do: [ :e| 
			transitions addAll: (self compartmentNames collect: [:f| 
				KETransition from: e to: f probability: 0
			])
		]	
	].
	^ transitions