Class {
	#name : #KEErdosGNPContactNetworkTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Network'
}

{ #category : #tests }
KEErdosGNPContactNetworkTest >> testNumberOfCyclesOfLengthFourInErdosGNPIsZero [
	| network node |
	network := KEErdosGNPContactNetwork new
		nodes: (1 to: 100);
		probability: 0.02.
	network run.
	node := network nodes at: 10.
	self assert: (network c4: node) equals: 0
]

{ #category : #tests }
KEErdosGNPContactNetworkTest >> testNumberOfCyclesOfLengthFourPlusChordInErdosGNPIsZero [
	| network node |
	network := KEErdosGNPContactNetwork new
		nodes: (1 to: 100);
		probability: 0.02.
	network run.
	node := network nodes at: 10.
	self assert: (network cc4: node) equals: 0
]

{ #category : #tests }
KEErdosGNPContactNetworkTest >> testNumberOfCyclesOfLengthTreeInErdosGNPIsZero [
	| network node |
	network := KEErdosGNPContactNetwork new
		nodes: (1 to: 100);
		probability: 0.02.
	network run.
	node := network nodes at: 10.
	self assert: (network c3: node) equals: 0
]

{ #category : #tests }
KEErdosGNPContactNetworkTest >> testNumberOfPathssOfLengthOneInHexagonGridIsTwo [
	| network node |
	network := KEErdosGNPContactNetwork new
		nodes: (1 to: 100);
		probability: 0.02.
	network run.
	node := network nodes at: 1.
	self assert: (network pathOfLength: 1 startingFrom: node) size equals: 2
]

{ #category : #tests }
KEErdosGNPContactNetworkTest >> testNumberOfPathssOfLengthTwoInHexagonGridIsSix [
	| network node |
	network := KEErdosGNPContactNetwork new
		nodes: (1 to: 100);
		probability: 0.02.
	network run.
	node := network nodes at: 1.
	self assert: (network p2: node) equals: 6 
]
