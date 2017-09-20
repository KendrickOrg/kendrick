as yet unclassified
"protocol: as yet unclassified"
checkIndexedExpression: indexList
	"Created by ThanhNT 20-July-2017"
	"Check an array is a multi-dimensions one or not"
	
	indexList do: [ :each| each class = KEVariable  ifTrue: [ ^true. ] ].
	
	^false.
