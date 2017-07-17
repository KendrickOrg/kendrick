as yet unclassified
evaluateWithModel: aModel
	|indexValues x allCompartments allKeys groupKeys count |
	indexValues := indexList collect: [ :each| each evaluateWithModel: aModel ].
	indexValues := indexValues collect: [ :each| each < 0 ifTrue: [ 0 ] ifFalse: [ each ] ].
	
	x := aModel atParameter: symbol.
	x isNumber ifTrue: [ ^ x ].
	x ifNil: [ 
		"currentPID := aModel currentPopulationID."
		"ThanhNT 13-July-2017"
		count := 0.
		groupKeys := '#'.
		x := self findKeysFromIndexedVariable: aModel at: (indexValues).
		allCompartments := (aModel population) compartments.
		allKeys := 	(allCompartments keys).
			allKeys 	do: [:each|
				count := 0.
				groupKeys := '#'.
				(each values) do: [ :item|
					((x findString: ('#' , (item asString), '#')) >= 1) 
						ifTrue: [ count := count + 1. 
									groupKeys := groupKeys , (item asString), '#'.
									]
				]. 
				count = (each values)	size & 
					(groupKeys size = x size)
					ifTrue: [ ^ aModel atCompartment: each. ]
				
			]."endof allKeys 	do: [:each|"
				
		
		"Endof ThanhNT 13-July-2017"
		].
	indexValues do: [ :each| x := (x at: each) ].
	^ x