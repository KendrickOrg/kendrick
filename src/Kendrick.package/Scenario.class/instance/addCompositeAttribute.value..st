as yet unclassified
addCompositeAttribute: arg1 value: arg2
	compartments at: arg1 put: arg2.
	(self allCompositeReferencesFor: arg1)
		doWithIndex: [ :arg3 :arg4 | 
			(arg2 anySatisfy: [ :arg5 | arg5 isCollection ])
				ifTrue: [ backEndEntity atCompartment: arg3 put: (arg2 flatten at: arg4) ]
				ifFalse: [ backEndEntity atCompartment: arg3 put: (arg2 at: arg4) ] ]