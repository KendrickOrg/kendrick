copying
copy
	| tmp1 |
	tmp1 := self class new.
	tmp1 attributes addAll: self attributes.
	^ tmp1