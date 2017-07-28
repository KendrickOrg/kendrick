copying
copy
	|newInstance|
	newInstance := self class new.
	newInstance attributes addAll: (self attributes).
	^ newInstance