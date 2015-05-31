tests
testEdgesRateValuesAddAll
	|g|
	g := KEGraph new.
	g addNodes: #(#mosquito #reservoir1 #reservoir2).
	g edges: #all rate: #beta values: 0.02.
	self assert: g edges size equals: 3