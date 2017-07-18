as yet unclassified
testEquivalence


	| resultsBefore resultsAfter |
	self createModels.

	beforeModel inspect.
	afterModel keModel inspect.

	"correct (check inspector) -- but timeseries are presented in different order fix"

	resultsBefore := (beforeDiagram data collect: [ :ts | ts peakOfEpidemic floor ]) sorted asOrderedCollection.
	resultsAfter := (afterDiagram data collect: [ :ts | ts peakOfEpidemic floor ]) sorted asOrderedCollection.
	Transcript show: resultsBefore; cr; show: resultsAfter; cr; cr.
	self assert: resultsBefore = resultsAfter.