meta
new: _algorithm from: _tMin to: _tMax step: _step
	(self deterministicSolvers keys includes: _algorithm) ifTrue: 
		[ ^ (KEDeterministicSimulator new) tMin: _tMin; tMax: _tMax; step: _step; algorithm: (self deterministicSolvers at: _algorithm) ].
	_algorithm = #Gillespie ifTrue: 
		[ ^ (KEGillespieSimulator new) tMin: _tMin; tMax: _tMax; step: _step ].
	_algorithm = #TauLeap ifTrue: 
		[ ^ (KETauLeapSimulator new) tMin: _tMin; tMax: _tMax; step: _step ].
	_algorithm = #IBM ifTrue:
		[ ^ (KEIndividualBasedSimulator new) tMin: _tMin; tMax: _tMax; step: _step ]