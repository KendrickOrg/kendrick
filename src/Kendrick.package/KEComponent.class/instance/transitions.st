accessing
transitions
	equations ifNotEmpty: [ self equationsToTransitions ].
	transitions isEmpty
		ifTrue: [ self compartmentNames
				do: [ :arg1 | 
					transitions
						addAll:
							(self compartmentNames
								collect: [ :arg2 | KETransition from: arg1 to: arg2 probability: 0 ]) ] ].
	^ transitions