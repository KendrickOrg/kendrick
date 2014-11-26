as yet unclassified
data: anAssociationOrAnArrayOfAssociations
	data := OrderedCollection new.
	anAssociationOrAnArrayOfAssociations isCollection 
	ifTrue: [ data addAll: anAssociationOrAnArrayOfAssociations ]
	ifFalse: [ data add: anAssociationOrAnArrayOfAssociations ]