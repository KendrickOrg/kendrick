as yet unclassified
createModels

	| beforePair |
	beforePair := self before.
	beforeSimulator := beforePair key.
	beforeModel := beforePair value.
	self after.
	afterSimulator := Simulation withId: 'SpatialRungeKutta'.
	afterModel := ModelComponent withId: 'MultiSpeciesSpatial'.
	(Visualization withId: 'SpatialDiagramViz') open.	