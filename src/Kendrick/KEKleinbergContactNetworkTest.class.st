Class {
	#name : #KEKleinbergContactNetworkTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Network'
}

{ #category : #tests }
KEKleinbergContactNetworkTest >> testNumberOfCyclesOfLengthFourInGrid2DIsFour [
	| grid2D node |
	grid2D := KEKleinbergContactNetwork new
		nodes: (1 to: 25 * 25);
		n: 25;
		p: 1;
		q: 0;
		r: 2.
	grid2D run.
	node := grid2D nodes at: 90.
	self assert: (grid2D c4: node) equals: 4
]

{ #category : #tests }
KEKleinbergContactNetworkTest >> testNumberOfCyclesOfLengthFourPlusChordInGrid2DIsZero [
	| grid2D node |
	grid2D := KEKleinbergContactNetwork new
		nodes: (1 to: 5 * 5);
		n: 5;
		p: 1;
		q: 0;
		r: 2.
	grid2D run.
	node := grid2D nodes at: 13.
	self assert: (grid2D cc4: node) equals: 0
]

{ #category : #tests }
KEKleinbergContactNetworkTest >> testNumberOfCyclesOfLengthTreeInGrid2DIsZero [
	| grid2D node |
	grid2D := KEKleinbergContactNetwork new
		nodes: (1 to: 25 * 25);
		n: 25;
		p: 1;
		q: 0;
		r: 2.
	grid2D run.
	node := grid2D nodes at: 90.
	self assert: (grid2D c3: node) equals: 0
]

{ #category : #tests }
KEKleinbergContactNetworkTest >> testNumberOfCyclesOfLengthTreeInKleinbergWithPEqualsTwoIsThirty [
	| grid2D node |
	grid2D := KEKleinbergContactNetwork new
		nodes: (1 to: 25 * 25);
		n: 25;
		p: 2;
		q: 0;
		r: 2.
	grid2D run.
	node := grid2D nodes at: 90.
	self assert: (grid2D c3: node) equals: 30
]

{ #category : #tests }
KEKleinbergContactNetworkTest >> testNumberOfPathsOfLengthOnInKleinbergWithPEqualsTwoIsTwelve [
	| grid2D |
	grid2D := KEKleinbergContactNetwork new
		nodes: (1 to: 25 * 25);
		n: 25;
		p: 2;
		q: 0;
		r: 2.
	grid2D run.
	self assert: (grid2D pathOfLength: 1 startingFrom: (grid2D nodes at: 90)) size equals: 12
]

{ #category : #tests }
KEKleinbergContactNetworkTest >> testNumberOfPathsOfLengthOneIn2DGridIsFour [
	| grid2D |
	grid2D := KEKleinbergContactNetwork new
		nodes: (1 to: 25 * 25);
		n: 25;
		p: 1;
		q: 0;
		r: 2.
	grid2D run.
	self assert: (grid2D pathOfLength: 1 startingFrom: (grid2D nodes at: 90)) size equals: 4
]

{ #category : #tests }
KEKleinbergContactNetworkTest >> testNumberOfPathsOfLengthTwoIn2DGridIsTwelve [
	| grid2D |
	grid2D := KEKleinbergContactNetwork new
		nodes: (1 to: 25 * 25);
		n: 25;
		p: 1;
		q: 0;
		r: 2.
	grid2D run.
	self assert: (grid2D pathOfLength: 2 startingFrom: (grid2D nodes at: 90)) size equals: 12
]

{ #category : #tests }
KEKleinbergContactNetworkTest >> testNumberOfPathsOfLengthZeroIn2DGridIsOne [
	| grid2D |
	grid2D := KEKleinbergContactNetwork new
		nodes: (1 to: 25 * 25);
		n: 25;
		p: 1;
		q: 0;
		r: 2.
	grid2D run.
	self assert: (grid2D pathOfLength: 0 startingFrom: (grid2D nodes at: 100)) size equals: 1
]
