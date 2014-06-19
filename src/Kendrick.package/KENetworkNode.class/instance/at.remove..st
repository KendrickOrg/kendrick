as yet unclassified
at: status remove: aNumberOfContacts
	|old|
	old := self contacts at: status ifAbsentPut: [ 0 ].
	(old = 0) | ((old - aNumberOfContacts) < 0) ifTrue: [ 
		^ self contacts at: status put: 0
		 ].
	^ self contacts at: status put: (old - aNumberOfContacts)