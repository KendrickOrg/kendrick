private
project: anArray into: k
	|attributes indexValues x|

	anArray isNumber ifTrue: [ ^anArray  ].
	attributes := (model attributes).
	indexValues := Array new: ((attributes size) - 1).
	2 to: (attributes size) do: [ 
		:each|
		|v index key|
		key := (attributes keys at: each).
		v := (attributes at: key).
		index := v indexOf: ((k at: key) value).
		indexValues at: (each - 1) put: index.
		 ].
	x := anArray.
	indexValues do: [ :each| x  := x at: each  ].
	^x.
	
