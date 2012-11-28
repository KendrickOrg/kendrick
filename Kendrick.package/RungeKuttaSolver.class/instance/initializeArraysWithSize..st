as yet unclassified
initializeArraysWithSize: aSize
	dydx := Array new: aSize.
	k1 := Array new: aSize.
	k2 := Array new: aSize.
	k3 := Array new: aSize.
	k4 := Array new: aSize.
	y := Array new: aSize.
	result := (Array new: aSize) collect: [ :each | Array new: nbIterations ]