as yet unclassified
new: _alg tMin: tMin tMax: tMax step: step model: model
	_alg = #RK4 ifTrue: [ 
			^ (KERK4Simulator new) tMin: tMin; tMax: tMax; step: step; model: model
		 ]
	"other algorithms pasted here"