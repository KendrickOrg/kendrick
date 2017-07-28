public-api
data: anArray "should be full math-expression"

	"refactor !!"

	explicitDataSet := true.
	
	builder = KEMapBuilder ifTrue: [ ^ lazyDataBlock := [self map: anArray] ].

	(#(sum sqrt size log peakOfEpidemic) includes: anArray last) ifTrue: [  
			self dataWithOp: anArray 
	] ifFalse: [  
			self dataWithCompartments: anArray		
	]