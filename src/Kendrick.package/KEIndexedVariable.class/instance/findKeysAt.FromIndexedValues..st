private
findKeysAt: aModel FromIndexedValues: indexValues
	| allAttributes position result allSpecies allSpatials|
	allAttributes := (aModel attributes).
	result := '#' , symbol , '#'.
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
		allAttributes keysDo: [ :k|
			((k = #status) or: (k = #species)) ifFalse:
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
	
	^result.