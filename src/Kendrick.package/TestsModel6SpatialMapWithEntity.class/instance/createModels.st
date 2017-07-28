as yet unclassified
createModels

	| beforeList |
	beforeList := self before.
	beforeSimulator := beforeList first.
	beforeModel := beforeList second.
	beforeDiagram := beforeList third.
	self after.
	afterSimulator := Simulation withId: 'SEIRSInfluenzaSim'.
	afterModel := ModelComponent withId: 'Influenza'.
	afterDiagram := (Visualization withId: 'SEIRSInfluenzaViz') open.	