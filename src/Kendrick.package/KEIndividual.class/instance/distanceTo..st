as yet unclassified
distanceTo: other
	|x y|
	x := self location.
	y := other location.
	^ ((x - y) raisedTo: 2) sum