as yet unclassified
findKeysFromIndexedVariable: aModel at: indexValues
	| allAttributes position result found allStatus allSpecies allSpatials|
	allAttributes := (aModel attributes).
	"allAttributes removeKey: #status."
	"allAttributes :"
	result := '#' , symbol , '#'.
	
	found := false.
	"indexOfStatus := 1."
	allStatus := allAttributes at: #status.
	allStatus do: [ :each|
		found ifFalse: [ 
				each = symbol ifTrue: [ found := true. ]
				
			 ].
		].
	found ifTrue:[
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
	"allAttributes values do: [ :each|
		position := 1.
		found ifFalse: [ 
				each do: [ :x|
					x = symbol ifTrue: [ found := true. ]
					].
			 ]"
		"ifTrue: [  
			(count <= indexValues size) ifTrue: [  
					each do: [ :x|
						(count <= indexValues size) ifTrue: [  
							position = (indexValues at: count) ifTrue: [ 
								result := result , x , '#'. count := count + 1." "found := true.""]
							ifFalse: [ position := position + 1 ]
						].
			 		].
		 		].
			]."
		"]."
	
	^result.
	"self halt."