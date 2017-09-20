as yet unclassified
testEquivalence


	| resultsBefore resultsAfter beforeResults afterResults |
	self createModels.

	"correct (check inspector) -- but timeseries are presented in different order fix"
	"roundDownTo: 0.001"
	beforeResults := beforeDiagram data sorted collect: [ :val | val roundDownTo: 0.001 ].
	afterResults :=  afterDiagram data sorted collect: [ :val | val roundDownTo: 0.001 ].
	Transcript show: beforeResults; cr; show: afterResults; cr; cr.
	self assert: beforeResults = afterResults.