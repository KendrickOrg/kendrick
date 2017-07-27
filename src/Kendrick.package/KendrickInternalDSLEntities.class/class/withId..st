as yet unclassified
withId: arg1
	| tmp1 tmp2 |
	tmp1 := self storedInstances select: [ :arg2 | arg2 id = arg1 ].
	tmp1 isEmpty
		ifFalse: [ ^ tmp1 first ].
	^ self pathLookUpFor: arg1