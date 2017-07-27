as yet unclassified
new: arg1
	| tmp1 tmp2 tmp3 |
	arg1 first = #scalefree
		ifTrue: [ tmp1 := KEScaleFreeNetworkTopology new ].
	arg1 first = #smallworld
		ifTrue: [ tmp1 := KESmallWorldNetworkTopology new ].
	arg1 first = #random
		ifTrue: [ tmp1 := KEERRandomNetworkTopology new ].
	tmp2 := arg1 size.
	2 to: tmp2 do: [ :tmp4 | 
		tmp3 := nil.
		tmp3 := ((arg1 at: tmp4) key asString , ':') asSymbol.
		tmp1 perform: tmp3 with: (arg1 at: tmp4) value ].
	^ tmp1