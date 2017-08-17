private
evaluateRates: rates from: tr
	|prob|
	(model checkTransition: tr) ifFalse: [ self addMoreTransitionsFrom: tr ToEvaluateRates: rates. ]
	ifTrue: [    
		|p|
		((tr from at: #status) = #empty)
		ifTrue: [ model currentCompartment: (tr to) ] 
		ifFalse: [ model currentCompartment: (tr from) ].
		model nextCompartment: (tr to).
		prob := (tr probability value: model) abs.
		prob isNumber ifTrue: [ p := prob ].
		prob isArray ifTrue: [ p := self project: prob into: (tr from). ].
		rates add: (p * (model atCompartment: tr from)).
		].