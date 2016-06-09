accessing
size
	| s |
	s := 0.
	compartments do: [:each | s := s + each ].
	^ s