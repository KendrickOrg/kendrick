private
findKeysFromIndexedVariable: aModel at: indexValues
	| allAttributes position result found allStatus allSpecies allSpatials|
	allAttributes := (aModel attributes).
	result := '#' , symbol , '#'.
	
	found := false.

	allStatus := allAttributes at: #status.
	allStatus do: [ :each|
		found ifFalse: [ 
				each = symbol ifTrue: [ found := true. ]
				
			 ].
		].
	found ifTrue:[
		"Implication: the first index is an element of species and the "
		"second one is of spatials"
		allSpecies := allAttributes at: #species.
		position := 1.
		allSpecies do: [ :x|
			(position = (indexValues at: 1)) ifTrue: [ 
				result := result , x , '#'.
			].
			position := position + 1. 
		].
	
		((indexValues size) = 2) ifTrue: [  
			allAttributes keys do: [ :k|
				((k = #status) | (k = #species)) ifFalse:
				[ 
					allSpatials := allAttributes at: k.
					position := 1.
					allSpatials do: [ :x|
						(position = (indexValues at: 2)) ifTrue: [ 
							result := result , (x asString) , '#'.
						].
				 		position := position + 1. 
					].
				].
			].	
		].
	
	].
	
	^result.