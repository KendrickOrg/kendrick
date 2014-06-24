as yet unclassified
interRateIsEvaluable: model
	(model population graph isNotNil)
	ifTrue: [ 
		^ (model population graph hasWeight: weight)
		 ].
	^ false