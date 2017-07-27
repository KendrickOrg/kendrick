utilities
equationsToTransitions
	| tmp1 |
	tmp1 := KEEventGenerator from: self.
	tmp1
		do: [ :arg1 | 
			arg1 fromStatus = #empty
				ifTrue: [ arg1 rate: (arg1 rate remove: (KEVariable new symbol: #N)) ] ];
		do: [ :arg2 | 
			| tmp2 tmp3 |
			tmp2 := arg2 fromStatus = #empty
				ifTrue: [ #empty ]
				ifFalse: [ Dictionary newFrom: {(#status -> arg2 fromStatus)} ].
			tmp3 := arg2 toStatus = #empty
				ifTrue: [ #empty ]
				ifFalse: [ Dictionary newFrom: {(#status -> arg2 toStatus)} ].
			self addTransitionFrom: tmp2 to: tmp3 probability: arg2 rate ].
	equations := OrderedCollection new