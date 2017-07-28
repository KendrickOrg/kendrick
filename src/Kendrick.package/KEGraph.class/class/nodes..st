accessing
nodes: argument
	|g|
	g := super new.
	argument isNumber ifTrue: [ 1 to: argument do: [ :i| g addNode: i asString asSymbol] ].
	argument isArray ifTrue: [ argument do: [ :e| g addNode: e ] ].
	^ g