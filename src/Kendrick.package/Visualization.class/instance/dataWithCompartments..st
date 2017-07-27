public-api
dataWithCompartments: arg1
	| tmp1 |
	^ lazyDataBlock := [ (arg1 first asString includes: $_)
		ifTrue: [ self dataWithCompositeCompartments: arg1 ]
		ifFalse: [ self dataWithSimpleCompartments: arg1 ] ]