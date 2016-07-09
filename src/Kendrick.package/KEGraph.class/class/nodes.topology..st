as yet unclassified
nodes: argument topology: aTopology
	|g|
	g := self new.
	argument isNumber ifTrue: [ 1 to: argument do: [ :i| g addNode: i asString asSymbol] ].
	argument isArray ifTrue: [ argument do: [ :e| g addNode: e ] ].
	(KENetworkTopology new: aTopology) applyOn: g.
	^ g