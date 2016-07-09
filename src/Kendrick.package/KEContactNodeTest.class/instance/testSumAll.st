as yet unclassified
testSumAll
	|node|
	node := KEContactNode new.
	
	self assert: (node sumAll: #(1 2 3)) equals: 6.
	self assert: (node sumAll: #(#(1 2) #(3 4 5))) equals: 15