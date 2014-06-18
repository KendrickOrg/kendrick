accessing
preferredDataMax
	|nbSpecies tmp |
	nbSpecies := (data at: 1) size.
	tmp := Array new: (data size).
	1 to: (tmp size) do: [:i|
		tmp at: i put: ((data at: i) max)
		].
	^tmp max