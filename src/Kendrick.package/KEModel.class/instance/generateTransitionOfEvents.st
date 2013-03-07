as yet unclassified
generateTransitionOfEvents

| listOfTransitions count |
eventList := self generateEvents.
	"Finding transition of each event in eventList. Each transition: rate, actions, fromStatus, toStatus. If event has no transition, toStatus: nil"
	listOfTransitions := Array new: (eventList size).
	count := 1.
	eventList do:[:eachEvent|
		|aTransition|
		aTransition := (KETransition new) rate: (eachEvent rate); actions: (eachEvent actions); fromStatus: nil; toStatus: nil; eqIndex: (eachEvent eqIndex); eqIndexVar: (eachEvent eqIndexVar).		
		eachEvent actions keysAndValuesDo:[:status :modification |				
			(modification > 0) ifTrue: [aTransition toStatus: status].
			(modification < 0) ifTrue: [aTransition fromStatus: status].
			].
		listOfTransitions at: count put: aTransition.
		count := count + 1.
		].
	^listOfTransitions