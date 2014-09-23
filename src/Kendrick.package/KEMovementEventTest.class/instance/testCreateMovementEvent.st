as yet unclassified
testCreateMovementEvent
	|event|
	event := KEMovementEvent new: #S from: #(0 1) to: #(0 2) rate: 0.01.
	
	self assert: event actions size equals: 2.
	self assert: event compartment equals: #S.
	self assert: event fromStatus equals: #(0 1).
	self assert: event toStatus equals: #(0 2)  