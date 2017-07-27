as yet unclassified
models
	| tmp1 tmp2 tmp3 |
	tmp1 := OrderedCollection new.
	tmp2 := KEDeterministicExamples new.
	tmp3 := KEDeterministicExamples selectors
		select: [ :arg1 | arg1 beginsWith: 'model' ].
	tmp3 do: [ :arg2 | tmp1 add: (tmp2 perform: arg2) ].
	^ tmp1