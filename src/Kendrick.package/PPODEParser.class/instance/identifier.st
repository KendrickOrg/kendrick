grammar
identifier
	^ super identifier flatten
		==> [ :arg1 | KEVariable new symbol: arg1 asSymbol ]