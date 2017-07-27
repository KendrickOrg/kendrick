information
distanceTo: arg1
	| tmp1 tmp2 |
	tmp1 := self position.
	tmp2 := arg1 position.
	^ (tmp1 - tmp2 raisedTo: 2) sum