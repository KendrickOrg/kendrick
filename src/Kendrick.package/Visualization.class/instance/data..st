public-api
data: arg1
	explicitDataSet := true.
	builder = KEMapBuilder
		ifTrue: [ ^ lazyDataBlock := [ self map: arg1 ] ].
	(#(#sum #sqrt #size #log #peakOfEpidemic) includes: arg1 last)
		ifTrue: [ self dataWithOp: arg1 ]
		ifFalse: [ self dataWithCompartments: arg1 ]