as yet unclassified
runtimeExpr
	runtimeExpr ifNil: [ 
		|couplingEvents eq|
		runtimeExpr := OrderedCollection new.
		couplingEvents := self arguments at: #1.
		eq := self arguments at: #2.
		couplingEvents do: [ :each|
			(each fromStatus = eq variable symbol) | (each toStatus = eq variable symbol) ifTrue: [ runtimeExpr add: each ]
			 ]
		 ].
	^ runtimeExpr
	