as yet unclassified
remainingMatrixAfterProjecting: aTransitionList
	|result domain selectedTrs|
	domain := self attributes keys first.
	result := OrderedCollection new.
	
	selectedTrs := aTransitionList select: [ :tr| 
		(tr from at: domain) = (tr to at: domain)
		].
	selectedTrs isEmpty ifTrue: [ 
		"generate a matrix zero for the remaining"
		|keys tmp|
		tmp := aTransitionList collect: [ :tr| 
			|e|
			e := KETransition from: tr from copy to: tr to copy probability: tr probability.
			e from removeKey: domain.
			e to removeKey: domain.
			e  ].
		keys := self generateKeys: tmp.
		keys do: [ :f| 
			result addAll: (keys collect: [:t| 
				KETransition from: f to: t probability: 0])].
		^ result
		].
	selectedTrs := selectedTrs collect: [ :tr| |e|
		e := KETransition from: tr from copy to: tr to copy probability: tr probability.
		e from removeKey: domain. 
		e to removeKey: domain.
		e ].
	selectedTrs do: [ :tr| 
		(result includes: tr) ifFalse: [ result add: tr ] ].
	^ result