as yet unclassified
doBirthTransitions
	self birthTransitions
		do: [ :arg1 | 
			| tmp1 tmp2 tmp3 tmp4 tmp5 |
			model currentCompartment: arg1 key to.
			tmp1 := (arg1 key probability value: model) abs.
			tmp1 := tmp1 * (model atCompartment: arg1 key from).
			tmp2 := (PoissonGenerator lambda: tmp1 * step) next.
			tmp3 := tmp2.
			tmp5 := tmp3.
			1 to: tmp5 do: [ :tmp6 | 
				tmp4 := nil.
				tmp4 := KEIndividual new.
				tmp4
					currentStatus: arg1 key to;
					updateAttributes: arg1 key to;
					nextStatus: nil.
				model population addIndividual: tmp4 ].
			self transitionNbExecutions at: arg1 value put: tmp2 ]