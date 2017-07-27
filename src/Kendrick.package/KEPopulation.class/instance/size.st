accessing
size
	| tmp2 |
	tmp2 := 0.
	compartments do: [ :arg1 | tmp2 := tmp2 + arg1 ].
	^ tmp2