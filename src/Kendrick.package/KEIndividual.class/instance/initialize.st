as yet unclassified
initialize
	super initialize.
	attributes := Dictionary new.
	behaviorBuilder := KEBehaviorBuilder new.
	attributes at: #alive put: true