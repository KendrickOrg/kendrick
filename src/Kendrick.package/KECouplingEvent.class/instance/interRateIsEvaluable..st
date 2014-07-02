as yet unclassified
interRateIsEvaluable: model
	(model population hasGraph)
	ifTrue: [ 
		^ (model population graph hasWeight: weight)
		 ].
	^ false