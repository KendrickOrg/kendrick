private
evaluateRates: rates from: tr
	|prob|
	(model checkTransition: tr) ifFalse: [ self addMoreTransitionsFrom: tr ToEvaluateRates: rates. ]
	ifTrue: [    
		|p c comp|
		((tr from at: #status) = #empty)
		ifTrue: [ model currentCompartment: (tr to) ] 
		ifFalse: [ model currentCompartment: (tr from) ].
		model nextCompartment: (tr to).
		prob := (tr probability value: model) abs.
		prob isNumber ifTrue: [ p := prob ].
		prob isArray ifTrue: [ p := self project: prob into: (tr from). ].
		comp := model atCompartment: tr from.
		comp isNumber ifTrue: [ c := comp ].
		comp isArray ifTrue: [ c := self project: comp into: (tr from). ].
		rates add: (p * c).
		].