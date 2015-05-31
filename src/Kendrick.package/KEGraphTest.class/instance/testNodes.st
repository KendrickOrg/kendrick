tests
testNodes
	|g|
	g := KEGraph new.
	g addNodes: #(#mosquito #reservoir1 #reservoir2).
	self assert: (g nodes size) equals: 3 