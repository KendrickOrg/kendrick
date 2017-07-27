as yet unclassified
createModels
	| tmp1 |
	tmp1 := self before.
	beforeSimulator := tmp1 first.
	beforeModel := tmp1 second.
	beforeDiagram := tmp1 third.
	self after.
	afterSimulator := Simulation withId: 'SpatialRungeKutta'.
	afterModel := ModelComponent withId: 'Infuenza'.
	afterDiagram := (Visualization withId: 'SpatialDiagramViz') open