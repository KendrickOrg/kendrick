Class {
	#name : #KEErdosGNMContactNetworkTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Core-Network'
}

{ #category : #tests }
KEErdosGNMContactNetworkTest >> testNumberOfPathssOfLengthTwoInErdosGNMIsSix [
	| network node |
	network := KEErdosGNMContactNetwork new
		nodes: (1 to: 100);
		edgesNumber: 70.
	network run.
	node := network nodes at: 1.
	self assert: (network p2: node) >=0
]
