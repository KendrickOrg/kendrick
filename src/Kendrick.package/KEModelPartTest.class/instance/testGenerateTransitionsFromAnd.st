tests-as yet unclassified
testGenerateTransitionsFromAnd
	| tmp1 tmp2 tmp3 |
	tmp1 := KETransition
		from: {(#status -> #S)}
		to: {(#status -> #I)}
		probability: [ :arg1 | arg1 atCompartment: {(#status -> #I)} ].
	tmp2 := {(Dictionary newFrom: {(#species -> #mosquito)}).
	(Dictionary newFrom: {(#species -> #reservoir1)}).
	(Dictionary newFrom: {(#species -> #reservoir2)})}.
	tmp3 := KEModelPart new.
	self
		assert: (tmp3 generateTransitionsFrom: tmp1 and: tmp2) size
		equals: 3