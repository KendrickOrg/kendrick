protected
allTransitionRefsForAttributeWith: aCompartment
	
	|assoc|

	aCompartment asString translateToLowercase = 'empty'
		ifTrue: [ ^ { #empty } ].
	
	assoc := (attributes associations select: [ :pair | pair value includes: aCompartment ]).
	^ assoc value collect: [:comp | '{#' , assoc key asString , ': #' , comp , '}']