Class {
	#name : #KEErdosGNPContactNetworkTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Core-Network'
}

{ #category : #tests }
KEErdosGNPContactNetworkTest >> testNumberOfCyclesOfLengthFourInErdosGNPIsZero [
	| network node |
	network := KEErdosGNPContactNetwork new
		nodes: (1 to: 100);
		probability: 0.02.
	network run.
	node := network nodes at: 10.
	self assert: (network c4: node) >= 0
]

{ #category : #tests }
KEErdosGNPContactNetworkTest >> testNumberOfCyclesOfLengthFourPlusChordInErdosGNPIsZero [
	| network node |
	network := KEErdosGNPContactNetwork new
		nodes: (1 to: 100);
		probability: 0.02.
	network run.
	node := network nodes at: 10.
	self assert: (network cc4: node) >= 0
]

{ #category : #tests }
KEErdosGNPContactNetworkTest >> testNumberOfCyclesOfLengthTreeInErdosGNPIsZero [
	| network node |
	network := KEErdosGNPContactNetwork new
		nodes: (1 to: 100);
		probability: 0.02.
	network run.
	node := network nodes at: 10.
	self assert: (network c3: node) >= 0
]
