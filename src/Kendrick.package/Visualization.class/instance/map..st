as yet unclassified
map: arg1
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	explicitDataSet := true.
	tmp1 := OrderedCollection new.
	tmp5 := arg1 first.
	tmp3 := (arg1 second findTokens: '_')
		collect: [ :arg2 | simulation model allLiteralTransitionRefsForAttribute: arg2 ].
	tmp4 := self expand: #() forLists: tmp3.
	self buildMapFrom: tmp5 given: tmp4.
	tmp1 := tmp4
		collect: [ :arg3 | (simulation allTimesSeriesContaining: arg3) first ].
	(#(#sum #sqrt #size #log #peakOfEpidemic) includes: arg1 last)
		ifTrue: [ tmp1 := tmp1 collect: [ :arg4 | arg4 perform: arg1 last ] ].
	^ diag data: tmp1