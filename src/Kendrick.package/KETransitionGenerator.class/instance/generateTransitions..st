as yet unclassified 
generateTransitions: aModel
	"This method will generate a transition list for each population of the model"

	| events trans |
	events := KEEventGenerator from: aModel.
	model := aModel.
	trans := OrderedCollection new.

	events
		do: [ :e | 
			e fromStatus = #empty
				ifTrue: [ e rate: (e rate remove: (KEVariable new symbol: #N)) ] ].
	events
		do: [ :each | 
			| from to |
			from := each fromStatus = #empty
				ifTrue: [ #empty ]
				ifFalse: [ Dictionary newFrom: {(#status -> each fromStatus)} ].
			to := each toStatus = #empty
				ifTrue: [ #empty ]
				ifFalse: [ Dictionary newFrom: {(#status -> each toStatus)} ].
			trans add: (KETransition from: from to: to probability: each rate) ].
	^trans.