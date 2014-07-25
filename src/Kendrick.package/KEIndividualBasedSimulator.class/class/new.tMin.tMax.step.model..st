as yet unclassified
new: _algorithm tMin: tMin tMax: tMax step: step model: model
	_algorithm = #IBMDiscreteTime ifTrue: [ 
		^ (KEDiscreteTimeIBSimulator new) tMin: tMin; tMax: tMax; step: step; model: model
		 ].
	_algorithm = #IBMDiscreteSpace ifTrue: [ 
		^ (KEDiscreteSpaceIBSimulator new) tMin: tMin; tMax: tMax; step: step; model: model
		 ]