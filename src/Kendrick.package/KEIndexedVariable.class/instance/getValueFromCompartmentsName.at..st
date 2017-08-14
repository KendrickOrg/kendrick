private
getValueFromCompartmentsName: tempKeys at: aModel
	|allCompartments allKeys count groupKeys|
	count := 0.
	allCompartments := (aModel population) compartments.
	allKeys := 	(allCompartments keys).
	allKeys 	do: [:each|
		count := 0.
		groupKeys := '#'.
		(each values) do: [ :item|
			((tempKeys findString: ('#' , (item asString), '#')) >= 1) 
				ifTrue: [ count := count + 1. 
							groupKeys := groupKeys , (item asString), '#'.
							]
		]. 
		count = (each values)	size & (groupKeys size = tempKeys size)
		ifTrue: [ 
			|result|
			result := aModel atCompartment: each. 
			^result.
		]
				
		]."endof allKeys 	do: [:each|"
	^nil.	
		