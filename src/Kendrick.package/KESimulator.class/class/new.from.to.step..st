instance creation
new: algorithm from: tMin to: tMax step: step
	(self deterministicSolvers keys includes: algorithm) ifTrue: 
		[ ^ (KEDeterministicSimulator new) tMin: tMin; tMax: tMax; step: step; algorithm: (self deterministicSolvers at: algorithm) ].
	algorithm = #Gillespie ifTrue: 
		[ ^ (KEGillespieSimulator new) tMin: tMin; tMax: tMax; step: step ].
	"algorithm = #GPUGillespie ifTrue: 
		[ ^ (KEGPUStochasticSimulator new) tMin: tMin; tMax: tMax; step: step ]."
	algorithm = #TauLeap ifTrue: 
		[ ^ (KETauLeapSimulator new) tMin: tMin; tMax: tMax; step: step ].
	algorithm = #IBM ifTrue:
		[ ^ (KEIndividualBasedSimulator new) tMin: tMin; tMax: tMax; step: step ]