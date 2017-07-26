utilities
equationsToTransitions
	|  events |
	events := KEEventGenerator from: self.
	events
		do: [ :e | 
			e fromStatus = #empty
				ifTrue:
					[ e rate: (e rate remove: (KEVariable new symbol: #N)) ]
				].
	events
		do: [ :each | 
			| from to |
			from := each fromStatus = #empty
				ifTrue: [ #empty ]
				ifFalse: [ Dictionary newFrom: {(#status -> each fromStatus)} ].
			to := each toStatus = #empty
				ifTrue: [ #empty ]
				ifFalse: [ Dictionary newFrom: {(#status -> each toStatus)} ].
			self addTransitionFrom: from to: to probability: each rate ].

	"why resetting the equations ?"
	equations := OrderedCollection new