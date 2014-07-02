as yet unclassified
passSimulatorClass: class
	class = KEDeterministicSimulator ifTrue: [ ^ KEDetSimulatorBuilder new ].
	class = KEGillespieDirectSimulator ifTrue: [ ^ KEGillespieDirectSimulatorBuilder new ].
	class = KEExplicitTauLeapSimulator ifTrue: [ ^ KEExplicitTauLeapSimulatorBuilder new ].
	class = KEIndividualBasedSimulator ifTrue: [ ^ KEIBSimulatorBuilder new ].