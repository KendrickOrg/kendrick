tests
testPreferredDataMaxOfASeries
	| s1 s2 |
	s1 := KESeries from: #(#(4 5) #(2 3) #(6 12) #(8 9) #(10 3)).
	self assert: (s1 preferredDataMax) equals: 12.
	