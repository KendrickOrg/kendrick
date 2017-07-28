as yet unclassified
separateExpression
	|list|
	list := OrderedCollection new.
	(leftHandSide isSeparable) ifTrue: [
		|l|
		l := OrderedCollection new.
		list := leftHandSide doSeparation.
		list do: [:each| 
			|e|
			e := (KEBinaryExpression new) op: op; leftHandSide: each; rightHandSide: rightHandSide.
			e isSeparable ifTrue: [l addAll: (e doSeparation)] ifFalse: [l add: e].
			].
		^ l
		]
	ifFalse: [
		rightHandSide isSeparable ifTrue: [
			|l|
			l := OrderedCollection new.
			list := rightHandSide doSeparation.
			list do: [:each| 
				|e|
				e := (KEBinaryExpression new) op: op; leftHandSide: leftHandSide; rightHandSide: each.
				e isSeparable ifTrue: [l addAll: (e doSeparation)] ifFalse: [l add: e].
				].
			^ l
			]
		ifFalse: [list := self doSeparation.]
		].
	^ list