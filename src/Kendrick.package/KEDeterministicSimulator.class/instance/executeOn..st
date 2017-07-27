public
executeOn: arg1
	| tmp1 tmp2 tmp4 |
	super executeOn: arg1.
	equations := model buildEquations.
	tmp2 := ExplicitSystem
		block: [ :arg2 :arg3 | 
			| tmp6 tmp7 |
			tmp6 := Array new: model population compartments size.
			tmp7 := 1.
			model population compartments
				keysDo: [ :arg4 | 
					model population compartments at: arg4 put: (arg2 at: tmp7).
					tmp7 := tmp7 + 1 ].
			tmp7 := 1.
			model population compartments
				keysDo: [ :arg5 | 
					| tmp8 |
					(equations at: arg5) isEmpty
						ifTrue: [ tmp8 := 0 ]
						ifFalse: [ tmp8 := ((equations at: arg5)
								collect: [ :arg6 | 
									| tmp9 |
									((arg6 at: 1) from at: #status) = #empty
										ifTrue: [ model currentCompartment: (arg6 at: 1) to ]
										ifFalse: [ model currentCompartment: (arg6 at: 1) from ].
									model nextCompartment: (arg6 at: 1) to.
									tmp9 := ((arg6 at: 1) probability value: model) abs.
									(arg6 at: 2) * tmp9
										* (model atCompartment: (arg6 at: 1) from) ]) sum ].
					tmp6 at: tmp7 put: tmp8.
					tmp7 := tmp7 + 1 ].
			tmp6 ].
	self stepper: ((Smalltalk at: self solver) onSystem: tmp2).
	tmp4 := model population compartments values.
	tmp1 := model population compartments keys.
	(tMin to: tMax by: step)
		do: [ :arg7 | 
			| tmp10 |
			self saveCompartmentsValueAtTime: arg7.
			model t: arg7.
			tmp4 := stepper doStep: tmp4 time: arg7 stepSize: step.
			tmp10 := tmp1 size.
			1 to: tmp10 do: [ :tmp11 | 
				model population compartments
					at: (tmp1 at: tmp11)
					put: (tmp4 at: tmp11) ].
			1 ]