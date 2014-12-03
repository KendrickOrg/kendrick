as yet unclassified
addTransition: aTransition
	"Allowing to define a basic transition et generate automatically a set of equivalent transitions for compartments with the same status"
	((compartments keys includes: aTransition from) or: [ compartments keys includes: aTransition to ]) 
	ifTrue: [ transitions add: aTransition ]
	ifFalse: [ |from to names|
		"generate automatically a set of transitions for compartments"
		aTransition from = #empty ifTrue: [ 
			from := #empty.
			names := self atCompartment: aTransition to
			 ].
		aTransition to = #empty ifTrue: [ 
			to := #empty.
			names := self atCompartment: aTransition from
			 ].
		((aTransition from ~= #empty) and: [ aTransition to ~= #empty ])
		ifTrue: [ names := self atCompartment: aTransition from ].
		names keys do: [ :k|
			from ~=#empty ifTrue: [ from := ([|tmp| tmp:=k copy. tmp add: aTransition from associations first. tmp ] value) ].
			to ~= #empty ifTrue: [ to := ([|tmp| tmp:=k copy. tmp add: aTransition to associations first. tmp] value) ].
			transitions add: (KETransition from: from to: to rate: aTransition rate subPopulation: k)
			 ]
		 ]