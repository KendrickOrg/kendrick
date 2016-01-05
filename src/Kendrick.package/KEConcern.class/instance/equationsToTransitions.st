as yet unclassified
equationsToTransitions
	|eGenerator events|
	eGenerator := KEEventGenerator new.
	events := eGenerator generateEvents: self.
	events do: [ :e|
		e fromStatus = #empty ifTrue: [ 
			e rate: (e rate remove: (KEVariable new symbol: #N)) ]
		 ].
	events do: [ :each| |from to|
		each fromStatus = #empty ifTrue: [ from := #empty ] ifFalse: [ from := Dictionary newFrom: { #status->each fromStatus } ].
		each toStatus = #empty ifTrue: [ to := #empty ] ifFalse: [ to := Dictionary newFrom: { #status->each toStatus } ].
		self addTransitionFrom: from to: to probability: each rate
		 ].
	equations := OrderedCollection new.

