
!KEVariable methodsFor: 'as yet unclassified'!
evaluateWithModel: m
|x|
x := m atParameter:symbol.
x ifNil:[
	^ (m atCompartment: symbol) initialValue.
	].
^x 
! !
