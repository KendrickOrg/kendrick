as yet unclassified
initialize
	super initialize.
	attributes := Dictionary new.
	behaviorBuild := KEBehaviorBuilder new.
	attributes at: #alive put: true