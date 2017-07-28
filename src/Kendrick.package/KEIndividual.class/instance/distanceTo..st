information
distanceTo: other
	|x y|
	x := self position.
	y := other position.
	^ ((x - y) raisedTo: 2) sum