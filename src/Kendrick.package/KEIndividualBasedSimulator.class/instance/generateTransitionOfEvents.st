as yet unclassified
generateTransitionOfEvents

| eventList count |
	eventList := model generateEvents.
	listOfTransitions := Array new: (eventList size).
	count := 1.
	eventList do:[:eachEvent|
		|aTransition|
		aTransition := (KETransition new) 
						rate: (eachEvent rate); 
						fromStatus: nil; 
						toStatus: nil; 
						eqIndex: (eachEvent eqIndex); 
						eqIndexVar: (eachEvent eqIndexVar).		
		eachEvent actions keysAndValuesDo:[:status :modification |				
			(modification > 0) ifTrue: [aTransition toStatus: status].
			(modification < 0) ifTrue: [aTransition fromStatus: status].
			].
		listOfTransitions at: count put: aTransition.
		count := count + 1.
		].
	^listOfTransitions