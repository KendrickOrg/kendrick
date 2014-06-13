accessing
forEachNode: aBlock
	"Simplest DSL that add a collection of sub-population into population"
	"i.e: population nodes: ($a $b $c)"
	self nodes do: [ :each| aBlock value: each ]
	