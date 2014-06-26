as yet unclassified
generateEvents: model
	|eventList|
	eventList := super generateEvents: model.
	1 to: eventList size do: [ :i| |each|
		each := eventList at: i.
		(self check: each hasCoupling: (model compartmentSymbols)) ifTrue: [
			|couplingEvent|
			couplingEvent := KECouplingEvent new 
									rate: (each rate); 
									fromStatus: (each fromStatus); 
									toStatus: (each toStatus); 
									actions: (each actions); 
									weight: (each rate getParameter: (model parameters)); 
									couplingRate: (each rate removeIndexedVariable). 
			eventList at: i put: couplingEvent
			 ].
		  ].
	^ self simulatorBuilder buildEvents: eventList
	"^ newList"