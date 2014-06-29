as yet unclassified
calProbOld: ind
	|events moveEvents rand eChosen|
	rand := Random new.
	"Select possible events of individual"
	events := self eventList at: (ind currentStatus) ifAbsent: [ OrderedCollection new ].
	eChosen := ((rand next) * (events size)) ceiling.
	(eChosen > 0) ifTrue: [ self execute: eChosen in: events on: ind attribute: #nextStatus ].
	self movementEventList ifNotNil: [ 
		"Select possible movement events of individual"
		moveEvents := self movementEventList at: (ind pid) ifAbsent: [ OrderedCollection new ].
		eChosen := ((rand next) * (moveEvents size)) ceiling.
		(eChosen > 0) ifTrue: [ self execute: eChosen in: moveEvents on: ind attribute: #moveTo ]
		 ]
	