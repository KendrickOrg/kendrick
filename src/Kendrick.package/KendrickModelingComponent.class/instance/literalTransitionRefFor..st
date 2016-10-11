protected
literalTransitionRefFor: aCompartment
	
	|assoc|

	
	aCompartment = 'Empty'
		ifTrue: [ ^ #empty ].
	assoc := (attributes associations select: [ :pair | pair value includes: aCompartment ]) first.
	^ {   assoc key -> aCompartment }.
	