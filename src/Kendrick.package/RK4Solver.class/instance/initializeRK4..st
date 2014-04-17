as yet unclassified
initializeRK4: systemSize
	y := Array new: systemSize.
	dydx := Array new: systemSize.
	data := Array new: systemSize.
	