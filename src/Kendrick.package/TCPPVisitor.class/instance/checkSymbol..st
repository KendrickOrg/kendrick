as yet unclassified 
checkSymbol: aKEVariable
	"Created by ThanhNT 6/7"
	| allCompartments allKeys x index |
	allCompartments := self compartments.
	allKeys := 	(allCompartments keys).
	index := 0.
	allKeys 	do: [:each|
		"t := (each values) asString."
		"x := t at: 1. => error Key Not Found"
		"x := (t value) asString. => return a String: Dictionary"
		"x := (t values) asString."
		x := ''.
		(each values) do: [ :item|
			x := x , item.
			 ].
		(x = ((aKEVariable symbol) asString))   ifTrue: [ ^index ].
		index := index + 1.
		"aStream nextPutAll: (x asString)"
		].
	^(-1).