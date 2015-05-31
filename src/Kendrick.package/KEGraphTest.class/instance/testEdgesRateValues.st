tests
testEdgesRateValues
	|g|
	g := KEGraph new.
	g addNodes: #(#mosquito #reservoir1 #reservoir2).
	g edges: { #mosquito->#reservoir1. #mosquito->#reservoir2 } rate: #beta values: 0.02.
	self assert: g edges size equals: 2