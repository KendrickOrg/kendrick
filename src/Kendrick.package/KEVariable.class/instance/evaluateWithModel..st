as yet unclassified
evaluateWithModel: arg1
	| tmp1 |
	((arg1 attributes at: #status ifAbsent: [ OrderedCollection new ])
		includes: symbol)
		ifTrue: [ ^ arg1 atCompartment: {(#status -> symbol)} ].
	tmp1 := arg1 atParameter: symbol.
	^ tmp1