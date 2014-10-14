as yet unclassified
testCreateMovementEvent
	|event|
	event := KEMovementEvent new: #S from: (KEPopulation new) to: (KEPopulation new) rate: 0.01.
	
	self assert: event actions size equals: 2.
	self assert: event compartment equals: #S.
	self assert: event fromStatus isPopulation equals: true.
	self assert: event toStatus isPopulation equals: true  