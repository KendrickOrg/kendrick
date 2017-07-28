as yet unclassified
createModels

	| beforeList |
	beforeList := self before.
	beforeSimulator := beforeList first.
	beforeModel := beforeList second.
	beforeDiagram := beforeList third.
	self after.
	afterSimulator := Simulation withId: 'SpatialRungeKutta'.
	afterModel := ModelComponent withId: 'MultiSpeciesSpatial'.
	afterDiagram := (Visualization withId: 'SpatialDiagramViz') open.	