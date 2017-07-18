copying
copy
	|new|
	new := KEIndividual new.
	new attributes addAll: (self attributes).
	^ new