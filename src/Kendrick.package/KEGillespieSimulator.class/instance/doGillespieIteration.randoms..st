as yet unclassified
doGillespieIteration: t randoms: rands
	|rates deltaT chosen|
	rates := OrderedCollection new.
	model t: t.
	model transitions do: [ :tr| 
		"|prob|
		((tr from at: #status) = #empty)
		ifTrue: [ model currentCompartment: (tr to) ] 
		ifFalse: [ model currentCompartment: (tr from) ].
		model nextCompartment: (tr to).
		prob := (tr probability value: model) abs.
		rates add: (prob * (model atCompartment: tr from))."
		self evaluateRates: rates from: tr.
		].
	(rates sum) = 0 ifTrue: [ ^ 0.0 ].
	deltaT := (((rands second) ln) negated) / (rates sum).
	chosen := self random: (rands first) select: rates.
	(model transitions at: chosen) executeOn: model times: 1.
	^ deltaT