as yet unclassified
generateSum: aTransitionList
	|result|
	result := OrderedCollection new.
	aTransitionList  do: [ :e| 
		|tmp|
		tmp := self transitions select: [ :tr| (tr from = e from) & (tr to = e to) ].
		tmp isEmpty 
		ifTrue: [ result add: e ]
	].
	result addAll: (self transitions select: [ :tr| tr probability ~= 0 ]).
	^ result
	
	