as yet unclassified
evaluateWithModel: aModel
	|indexValues x allCompartments allKeys groupKeys count |
	indexValues := indexList collect: [ :each| each evaluateWithModel: aModel ].
	"ThanhNT 19/7"
	"indexValues := indexValues collect: [ :each| each < 0 ifTrue: [ 0 ] ifFalse: [ each ] ]."
	indexValues := indexValues collect: [ :each| (self checkAllPositive: each) ifTrue: [ each ] ifFalse: [ 0 ] ].
	"Endof ThanhNT 19/7"
	
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
	"ThanhNT 20-July-2017"
	"Reason: the old statement cant handle indexValues which is"
	"multi-dimension array"
	"indexValues do: [ :each| x := (x at: each) ]."
	(self IsMultiDimensionsArray: x) ifTrue: [ 
		^x.
		 ]
	ifFalse: 
		[
			indexValues do: [ :each| x := (x at: each) ].
		].
	"Endof ThanhNT 20-July-2017"
	^ x