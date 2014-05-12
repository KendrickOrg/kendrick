as yet unclassified
testCreateGraphForMetaPopulationModel
	|graph|
	graph := self createSimpleMetaPopulation.
	self assert: graph subNodes size equals: 3.
	self assert: (graph atSubNode: 1) adjacentNodes asArray equals: #(2 3).
	self assert: ((graph atSubNode: 1) atParameter: #N) value equals: 10000.
	self assert: ((graph atSubNode: 1) weightOf: 2) equals: 0.02.
	self assert: ((graph atSubNode: 1) weightOf: 3) equals: 0.02.