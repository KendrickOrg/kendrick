as yet unclassified
checkIndexedExpression: indexList
	"protocol: as yet unclassified"
	"Check an array is a multi-dimensions one or not"

	indexList
		do: [ :each | 
			each class = KEVariable
				ifTrue: [ ^ true ] ].
	^ false