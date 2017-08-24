instance creation
from: aKEModel
	| transitions temp result |
	temp := self new.
	transitions := temp generateTransitions: aKEModel.
	result := OrderedCollection new.
	transitions
		do: [ :each | 
			(temp checkEnoughKeys: each)
				ifTrue: [ result add: each ]
				ifFalse: [ result addAll: (temp generateMoreTransitions: each) ] ].
	"temp reAssignParameterN."
	^ result