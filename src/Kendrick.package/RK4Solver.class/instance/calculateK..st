as yet unclassified
calculateK: model
	|k|
	k := Array new: (y size).
	dydx := self calculateDyDx: model.
	1 to: (y size) do: [ :i|
		k at: i put: (dydx at: i)*step
		 ].
	^ k