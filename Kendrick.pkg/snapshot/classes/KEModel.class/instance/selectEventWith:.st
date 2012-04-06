
!KEModel methodsFor: 'as yet unclassified'!
selectEventWith: p
 | sum |
sum := 0.
	eventList do:[:each | sum := sum + ((each rate) evaluateWithModel: self) abs.
		sum >= p ifTrue:[ ^each].
		].
^ nil! !
