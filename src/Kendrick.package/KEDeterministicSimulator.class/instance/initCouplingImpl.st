as yet unclassified
initCouplingImpl
	|couplingImpl events|
	couplingImpl := (KERuntimeCouplingEventImpl new) model: model.
	events := couplingImpl events select: [:each| each isCouplingEvent ].
	model equations do: [ :eq|
		|couplingExprImpl|
		couplingExprImpl := KECouplingExprImpl new.
		couplingExprImpl arguments at: #1 put: events.
		couplingExprImpl arguments at: #2 put: eq.
		eq rtExprImpls add: couplingExprImpl
		 ]