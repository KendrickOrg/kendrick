as yet unclassified
doTauLeapIteration: t
	| additionalTrans |
	additionalTrans := OrderedCollection new.
	model t: t.
	additionalTrans := self generateMoreTransitions.
	additionalTrans
		do: [ :tr | 
			| rate numPoisson prob p comp c |
			"model parameters at: #scope put: tr scope.
		model parameters at: #contactingSource put: (tr from)."
			(tr from at: #status) = #empty
				ifTrue: [ model currentCompartment: tr to ]
				ifFalse: [ model currentCompartment: tr from ].
			model nextCompartment: tr to.
			prob := (tr probability value: model) abs.
			p := self project: prob into: tr from.
			"prob isDictionary ifTrue: [ prob := prob values sum ]."
			comp := model atCompartment: tr from.
			c := self project: comp into: tr from.
			rate := p * c.
			numPoisson := (PoissonGenerator lambda: rate * step) next.
			tr executeOn: model times: numPoisson ]