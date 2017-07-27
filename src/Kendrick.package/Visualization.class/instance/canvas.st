protected
canvas
	| tmp2 |
	tmp2 := canvas.
	^ tmp2
		ifNil: [ simulation execute.
			explicitDataSet
				ifTrue: [ lazyDataBlock value ]
				ifFalse: [ diag data: simulation timeSeries ].
			xLabel ifNotNil: [ diag xLabel: xLabel ].
			KendrickInternalDSLEntities cleanUpForInteractiveSessions.
			canvas := diag build build view canvas ]
		ifNotNil: [ tmp2 ]