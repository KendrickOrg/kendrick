accessing
project: aTransitionList
	"This function will project a transition rate matrix to the domain of this concern. The result is a transition rate matrix"
	|result domain selectedTrs|
	domain := self attributes keys first. 
	result := OrderedCollection new.
	
	selectedTrs := aTransitionList select: [ :tr| (tr from at: domain) ~= (tr to at: domain) ].
	selectedTrs isEmpty 
	ifTrue: [ 
		^ self error: 'The model have not contained the concern on which depends this concern.' ].
	(selectedTrs collect: [:e| (KETransition from: (Array with: (e from associationAt: domain)) to: (Array with: (e to associationAt: domain)) probability: e probability) ]) do: [ :e| 
		(result includes: e) ifFalse: [ result add: e ]	
	].
	^ result