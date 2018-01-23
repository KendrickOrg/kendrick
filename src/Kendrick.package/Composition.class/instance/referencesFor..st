as yet unclassified
referencesFor: anAttribute

	|assoc|

	assoc := (self model attributes 
		associations select: [ :as | as value includes: anAttribute ]) first.
	^ assoc key asSymbol -> anAttribute asSymbol 

	