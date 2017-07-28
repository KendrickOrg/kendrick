protected
transitionRefFor: aCompartment
	
	|assoc|

	
	aCompartment = 'Empty'
		ifTrue: [ ^ #empty ].
	assoc := (attributes associations select: [ :pair | pair value includes: aCompartment ]) first.
	^ '{#' , assoc key asString , ': #' , aCompartment , '}'.