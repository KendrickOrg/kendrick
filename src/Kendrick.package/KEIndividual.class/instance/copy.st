copying
copy
	|newInstance|
	newInstance := self class new.
	newInstance updateAttributes: attributes.
	^ newInstance