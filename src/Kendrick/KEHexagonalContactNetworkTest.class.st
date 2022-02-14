Class {
	#name : #KEHexagonalContactNetworkTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Core-Network'
}

{ #category : #tests }
KEHexagonalContactNetworkTest >> testNumberOfCyclesOfLengthFourInHexagonGridIsZero [
	| gridTriang node |
	gridTriang := KEHexagonalContactNetwork new
		nodes: (1 to: 6 * 6);
		n: 6;
		m: 6.
	gridTriang run.
	node := gridTriang nodes at: 16.
	self assert: (gridTriang c4: node) equals: 0
]

{ #category : #tests }
KEHexagonalContactNetworkTest >> testNumberOfCyclesOfLengthFourPlusChordInHexagonGridIsZero [
	| gridTriang node |
	gridTriang := KEHexagonalContactNetwork new
		nodes: (1 to: 6 * 6);
		n: 6;
		m: 6.
	gridTriang run.
	node := gridTriang nodes at: 16.
	self assert: (gridTriang cc4: node) equals: 0
]

{ #category : #tests }
KEHexagonalContactNetworkTest >> testNumberOfCyclesOfLengthTreeInHexagonGridIsZero [
	| gridTriang node |
	gridTriang := KEHexagonalContactNetwork new
		nodes: (1 to: 6 * 6);
		n: 6;
		m: 6.
	gridTriang run.
	node := gridTriang nodes at: 16.
	self assert: (gridTriang c3: node) equals: 0
]

{ #category : #tests }
KEHexagonalContactNetworkTest >> testNumberOfPathsOfLengthTwoInHexagonGridIsSix [
	| network node |
	network := KEHexagonalContactNetwork new
		nodes: (1 to: 6 * 6);
		n: 6;
		m: 6.
	network run.
	node := network nodes at: 16.
	self assert: (network p2: node) equals: 6
]

{ #category : #tests }
KEHexagonalContactNetworkTest >> testNumberOfPathssOfLengthOneInHexagonGridIsTree [
	| gridTriang node |
	gridTriang := KEHexagonalContactNetwork new
		nodes: (1 to: 6 * 6);
		n: 6;
		m: 6.
	gridTriang run.
	node := gridTriang nodes at: 16.
	self assert: (gridTriang pathOfLength: 1 startingFrom: node) size equals: 3
]
