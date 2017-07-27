as yet unclassified
createModels
	| tmp1 |
	tmp1 := self before.
	beforeSimulator := tmp1 key.
	beforeModel := tmp1 value.
	self after.
	afterSimulator := Simulation withId: 'SpatialRungeKutta'.
	afterModel := ModelComponent withId: 'MultiSpeciesSpatial'.
	(Visualization withId: 'SpatialDiagramViz') open