accessing
indexOfTime: arg1
	^ index
		indexOf: arg1
		ifAbsent: [ | tmp1 |
			tmp1 := index size.
			1 to: tmp1 do: [ :tmp2 | 
				(index at: tmp2) > arg1
					ifTrue: [ ^ tmp2 ] ].
			1 ]