as yet unclassified
at: status add: aNumberOfContacts
	|old|
	old := self contacts at: status ifAbsentPut: [ 0 ].
	^ self contacts at: status put: (old + aNumberOfContacts)