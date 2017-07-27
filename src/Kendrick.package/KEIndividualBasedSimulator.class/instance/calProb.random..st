as yet unclassified
calProb: arg1 random: arg2
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 |
	tmp3 := self transitions
		at: arg1 currentStatus
		ifAbsent: [ OrderedCollection new ].
	tmp4 := tmp3 size.
	tmp7 := tmp4.
	1 to: tmp7 do: [ :tmp8 | 
		| tmp10 |
		tmp5 := nil.
		tmp5 := arg1 currentStatus copy.
		tmp5 at: #id put: arg1 id.
		tmp10 := model.
		tmp10
			currentCompartment: tmp5;
			nextCompartment: (tmp3 at: tmp8) key to.
		tmp1 := ((tmp3 at: tmp8) key probability value: model) abs.
		tmp2 := 1 - (step * tmp1) negated exp.
		tmp2 > arg2 next
			ifTrue: [ arg1 nextStatus: (tmp3 at: tmp8) key to.
				tmp6 := self transitionNbExecutions at: (tmp3 at: tmp8) value.
				^ self transitionNbExecutions
					at: (tmp3 at: tmp8) value
					put: tmp6 + 1 ] ]