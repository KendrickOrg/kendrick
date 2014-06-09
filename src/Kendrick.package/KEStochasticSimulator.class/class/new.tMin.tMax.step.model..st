as yet unclassified
new: _algorithm tMin: tMin tMax: tMax step: step model: model
	_algorithm = #GillespieDirect ifTrue: [ 
		^ (KEGillespieDirectSimulator new) tMin: tMin; tMax: tMax; step: step; model: model
		 ].
	_algorithm = #ExplicitTauLeap ifTrue: [ 
		^ (KEExplicitTauLeapSimulator new) tMin: tMin; tMax: tMax; step: step; model: model
		 ]