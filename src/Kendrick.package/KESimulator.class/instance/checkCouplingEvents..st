accessing
checkCouplingEvents: eventList
	"An event is a coupling event when its rate contains both fromStatus and toStatus, that means there are a coupling between two types of compartment for firing this event"
	1 to: eventList size do: [ :i| |each|
		each := eventList at: i.
		(each checkCouplingEvent: (model compartmentSymbols)) ifTrue: [
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
	^ eventList