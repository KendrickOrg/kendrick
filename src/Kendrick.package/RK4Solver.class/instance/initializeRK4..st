as yet unclassified
initializeRK4: aModel
	|size|
	size := (aModel equations size) * (aModel populationIDs size).
	y := Array new: size.
	dydx := Array new: size.
	data := Array new: size.
	1 to: size do: [ :i|
		data at: i put: (Array new: (self nbOfIterations))
		 ]