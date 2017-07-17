as yet unclassified 
visitAllCompartments: allCompartments
	"Created by ThanhNT 5/7"
	|aStream allKeys x index|
	aStream := WriteStream on: (String new: 60).
	allKeys := 	(allCompartments keys).
	index := 0.
	allKeys 	do: [:each|
		x := ''.
		(each values) do: [ :item|
			x := x , item.
			 ].
		aStream nextPutAll: String tab, 'compartmentName[', (index asString), '] = "',
			(x asString),
			'";';cr.
		index := index + 1.
			].

	index := 0.		
	allCompartments do: [ :each|
		x := (each value) asString.
		aStream nextPutAll: String tab, 'initialValue[', (index asString), '] = ',
			(x asString),
			';';cr.
		index := index + 1.		
		 ].	
	^ aStream contents
