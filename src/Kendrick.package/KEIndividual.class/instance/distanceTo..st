as yet unclassified
distanceTo: other
	|x y|
	x := self attributes at: #location.
	y := other attributes at: #location.
	^ ((x - y) raisedTo: 2) sum