as yet unclassified
doesNotUnderstand: arg1
	[ self storedInstances
		remove:
			(self storedInstances
				detect: [ :arg2 | arg2 id asSymbol = arg1 selector ]) ]
		on: NotFound
		do: [  ].
	^ self new id: arg1 selector