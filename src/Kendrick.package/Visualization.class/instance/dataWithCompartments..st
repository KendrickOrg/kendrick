public-api
dataWithCompartments: anArray "should be full math-expression"

	|tSeries|
		
		^ lazyDataBlock := [		
				(anArray first asString includes: $_)
						ifTrue: [self dataWithCompositeCompartments: anArray]
						ifFalse: [self dataWithSimpleCompartments: anArray]
			]
					
			