Class {
	#name : #KETriangularContactNetworkTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Core-Network'
}

{ #category : #tests }
KETriangularContactNetworkTest >> testNumberOfCyclesOfLengthFourFourPlusChordIInTriangularGridIsSix [
	| gridTriang node |
	gridTriang := KETriangularContactNetwork new
		nodes: (1 to: 11 * 11);
		n: 11;
		m: 11.
	gridTriang run.
	node := gridTriang nodes at: 39.
	self assert: (gridTriang cc4: node) equals: 6
]

{ #category : #tests }
KETriangularContactNetworkTest >> testNumberOfCyclesOfLengthFourInTriangularGridIsTwelve [
	| gridTriang node |
	gridTriang := KETriangularContactNetwork new
		nodes: (1 to: 11 * 11);
		n: 11;
		m: 11.
	gridTriang run.
	node := gridTriang nodes at: 39.
	self assert: (gridTriang c4: node) equals: 12
]

{ #category : #tests }
KETriangularContactNetworkTest >> testNumberOfCyclesOfLengthTreeInTriangularGridIsSix [
	| gridTriang node |
	gridTriang := KETriangularContactNetwork new
		nodes: (1 to: 6 * 6);
		n: 6;
		m: 6.
	gridTriang run.
	node := gridTriang nodes at: 15.
	self assert: (gridTriang c3: node) equals: 6
]

{ #category : #tests }
KETriangularContactNetworkTest >> testNumberOfPathsOfLengthOneInTriangularGridIsSix [
	| gridTriang node |
	gridTriang := KETriangularContactNetwork new
		nodes: (1 to: 6 * 6);
		n: 6;
		m: 6.
	gridTriang run.
	node := gridTriang nodes at: 15.
	self assert: (gridTriang pathOfLength: 1 startingFrom: node) size equals: 6
]

{ #category : #tests }
KETriangularContactNetworkTest >> testNumberOfPathsOfLengthTwoInTriangularGridIsThirty [
	| gridTriang node |
	gridTriang := KETriangularContactNetwork new
		nodes: (1 to: 11 * 11);
		n: 11;
		m: 11.
	gridTriang run.
	node := gridTriang nodes at: 39.
	self assert: (gridTriang p2: node)  equals: 30
]
