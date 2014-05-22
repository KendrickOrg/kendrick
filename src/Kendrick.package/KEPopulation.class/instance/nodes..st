accessing
nodes: aCollection
	"Simplest DSL that add a collection of sub-population into population"
	"i.e: population nodes: ($a $b $c)"
	aCollection isNumber 
	ifTrue: [ 
		1 to: aCollection do: [ :each|
			|node|
			node := KEPopulation new.
			self addSubPopulation: node.
			 ]
		 ]
	ifFalse: [ 
		nodeNames := aCollection.
		aCollection do: [ :each|
			|node|
			node := KEPopulation new.
			self addSubPopulation: node.
		 	].
		 ]
	