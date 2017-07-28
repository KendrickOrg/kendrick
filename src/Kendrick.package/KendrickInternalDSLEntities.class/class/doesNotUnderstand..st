as yet unclassified
doesNotUnderstand: aMessage
	

	
	[self storedInstances 
		remove: (self storedInstances detect: [:i | 
			i id asSymbol = aMessage selector  ])] 
		on: NotFound do: [  ].

	^ self new id: aMessage selector