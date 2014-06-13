as yet unclassified
initializeResult
	|size|
	size := (model equations size) * (model PIDList size).
	result := Array new: size.
	1 to: size do: [ :i| result at: i put: (OrderedCollection new) ]