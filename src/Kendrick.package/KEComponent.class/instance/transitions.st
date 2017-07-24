accessing
transitions
"Return a collection of transitions of the model"

	equations ifNotEmpty: [ self equationsToTransitions ].
	transitions isEmpty ifTrue: [  
		"generate a transition rate matrix of 0"
		self compartmentNames do: [ :e| 
			transitions addAll: (self compartmentNames collect: [:f| 
				KETransition from: e to: f probability: 0
			])
		]	
	].
	^ transitions