private
IsMultiDimensionsArray: anArray
	"Created by ThanhNT 20-July-2017"
	"Check an array is a multi-dimensions one or not"
	anArray isArray ifTrue: [  
		anArray do: [ :each| each isArray ifTrue: [ ^true. ] ]
		].
	^false.
