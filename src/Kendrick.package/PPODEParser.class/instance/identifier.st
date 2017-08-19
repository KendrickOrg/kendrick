grammar
identifier
	^ super identifier flatten ==> [ :string | KEVariable symbol: string asSymbol ]