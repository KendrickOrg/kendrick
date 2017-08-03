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
		]. "endof (each values) do: [ :item|"
			"(aModel checkIndexedExpression: indexList ) ifTrue: [ 
				((count = 1) and: ((indexList size) = ((aModel attributes) size) - 1))
					ifTrue: [ ^(self getIndexedValuesFrom: aModel). ]
				]"
				"ifFalse: ["
				count = (each values)	size & (groupKeys size = tempKeys size)
					ifTrue: [ 
						|result|
						result := aModel atCompartment: each. 
						^result.
						]
				 	"]."
				
		]."endof allKeys 	do: [:each|"
	^nil.	
		