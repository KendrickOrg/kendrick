as yet unclassified
with: anObject
	self new.
	anObject isCollection 
	ifTrue: [ self addAllSubNodes: anObject ] 
	ifFalse: [ self addSubNode: anObject ]