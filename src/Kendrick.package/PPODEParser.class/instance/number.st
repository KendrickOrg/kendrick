grammar
number
	^ super number flatten
		==> [ :arg1 | KENumerical new number: arg1 asNumber ]