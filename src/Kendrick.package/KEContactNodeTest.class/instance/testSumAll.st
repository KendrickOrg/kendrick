as yet unclassified
testSumAll
	| tmp1 |
	tmp1 := KEContactNode new.
	self
		assert: (tmp1 sumAll: #(1 2 3)) equals: 6;
		assert: (tmp1 sumAll: #(#(1 2) #(3 4 5))) equals: 15