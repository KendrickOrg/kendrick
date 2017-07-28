protected
canvas

	^ canvas ifNil: [  

		simulation execute.
		explicitDataSet 
			ifFalse: [ diag data: simulation timeSeries ]
			ifTrue: [ lazyDataBlock value ].
		xLabel ifNotNil: [diag xLabel: xLabel].
		KendrickInternalDSLEntities cleanUpForInteractiveSessions.

		"self halt."

		canvas := diag build build view canvas]