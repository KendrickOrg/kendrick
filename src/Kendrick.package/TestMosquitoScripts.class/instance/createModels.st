as yet unclassified
createModels

	beforePair := self before.
	beforeSimulator := beforePair key.
	beforeModel := beforePair value.
	self after.
	afterSimulator := Simulation withId: 'MosquitoGillepsie'.
	afterModel := ModelComponent withId: 'Mosquito'.
	(Visualization withId: 'MosquitoDiagramViz') open.	