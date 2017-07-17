as yet unclassified 
getFileName: aModel
	| aStream allCompartments allKeys x |
	aStream := WriteStream on: (String new: 10).
	
	self model ifNil: [ self model: aModel ].
	allCompartments := self compartments.
	nil == allCompartments ifTrue: [ aStream nextPutAll: 'NIL'. ]
		ifFalse: [  
			allKeys := 	(allCompartments keys).
			allKeys 	do: [:each|
				"t := (each values) asString."
				"x := t at: 1. => error Key Not Found"
				"x := (t value) asString. => return a String: Dictionary"
				"x := (t values) asString."
				x := ''.
				(each values) do: [ :item|
					x := x , item.
					 ].
				aStream nextPutAll: (x asString)
				].
			].
	aStream nextPutAll: '.cpp'.
	^ aStream contents
	