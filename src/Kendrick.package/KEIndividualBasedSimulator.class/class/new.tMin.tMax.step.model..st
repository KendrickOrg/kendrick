as yet unclassified
new: _algorithm tMin: tMin tMax: tMax step: step model: model
	_algorithm = #DiscreteTime ifTrue: [ 
		^ (KEDiscreteTimeIBSimulator new) tMin: tMin; tMax: tMax; step: step; model: model
		 ].
	_algorithm = #DiscreteSpace ifTrue: [ 
		^ (KEDiscreteSpaceIBSimulator new) tMin: tMin; tMax: tMax; step: step; model: model
		 ]