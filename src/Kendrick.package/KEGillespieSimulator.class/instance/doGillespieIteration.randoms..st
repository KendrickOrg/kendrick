as yet unclassified
doGillespieIteration: arg1 randoms: arg2
	| tmp1 tmp2 tmp3 |
	tmp1 := OrderedCollection new.
	model t: arg1.
	model transitions
		do: [ :arg3 | 
			| tmp4 |
			(arg3 from at: #status) = #empty
				ifTrue: [ model currentCompartment: arg3 to ]
				ifFalse: [ model currentCompartment: arg3 from ].
			model nextCompartment: arg3 to.
			tmp4 := (arg3 probability value: model) abs.
			tmp1 add: tmp4 * (model atCompartment: arg3 from) ].
	tmp1 sum = 0
		ifTrue: [ ^ 0.0 ].
	tmp2 := arg2 second ln negated / tmp1 sum.
	tmp3 := self random: arg2 first select: tmp1.
	(model transitions at: tmp3) executeOn: model times: 1.
	^ tmp2