as yet unclassified
launch
	|distances probs y id i j|
	"if the connection kernel function is not yet defined"
	kernel ifNil: [ kernel := [ :d| (d*5) negated exp ] ].
	"calculate the distance between any two individuals"
	distances := self calDistances.
	probs := self calProb: distances.
	y := probs sort: [ :a :b| a < b ].
	id := self indexOf: y in: probs.
	i := 1 + ((id-1)\\nbInd).
	j := 1 + ((id-1)//nbInd).
	1 to: id size do: [ :each| |_i _j edge|
		_i := i at: each.
		_j := j at: each.
		edge := Array with: _i with: _j.
		(_i ~= _j) & ((self checkEdge: edge) = 0) ifTrue: [ 
			self with: edge weight: #contact value: 1
			 ]
		 ].
	^ self
	
	