instance creation
new: algorithm from: tMin to: tMax by: stepTime

"Build a new simulator executing from tMin to tMax with a steptime."

	(self deterministicSolvers keys includes: algorithm) ifTrue: 
		[ ^ (KEDeterministicSimulator new) tMin: tMin; tMax: tMax; step: stepTime; solver: (self deterministicSolvers at: algorithm) ].
	algorithm = #Gillespie ifTrue: 
		[ ^ (KEGillespieSimulator new) tMin: tMin; tMax: tMax; step: stepTime ].
	algorithm = #TauLeap ifTrue: 
		[ ^ (KETauLeapSimulator new) tMin: tMin; tMax: tMax; step: stepTime ].
	algorithm = #IBM ifTrue:
		[ ^ (KEIndividualBasedSimulator new) tMin: tMin; tMax: tMax; step: stepTime ]