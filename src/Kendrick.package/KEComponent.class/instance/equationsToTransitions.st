accessing
equationsToTransitions
	| eGenerator events |
	eGenerator := KEEventGenerator new.
	events := eGenerator generateEvents: self.
	events
		do: [ :e | 
			e fromStatus = #empty
				ifTrue:
					[ e rate: (e rate remove: (KEVariable new symbol: #N)) ]
			"|symbol|
			symbol := parameters keyAtValue: #sizeOfPopulation ifAbsent: [#N]." ].
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
	equations := OrderedCollection new