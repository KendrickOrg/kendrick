as yet unclassified
createModels

	| beforeList |
	beforeList := self before.
	beforeSimulator := beforeList first.
	beforeModel := beforeList second.
	beforeDiagram := beforeList third.
	self after.
	afterSimulator := Simulation withId: 'MeaslesRKSim'.
	afterModel := ModelComponent withId: 'Measles'.
	afterDiagram := (Visualization withId: 'MeaslesDiagramViz') open.