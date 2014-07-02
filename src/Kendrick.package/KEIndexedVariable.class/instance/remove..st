as yet unclassified
remove: aVariable
	self symbol = aVariable symbol ifTrue: [ ^ nil ].
	^ self
		
	