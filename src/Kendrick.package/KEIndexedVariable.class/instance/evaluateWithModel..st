as yet unclassified
evaluateWithModel: aModel
	|indexValues x currentPID subPop|
	indexValues := indexList collect: [ :each| each evaluateWithModel: aModel ].
	indexValues := indexValues collect: [ :each| each < 0 ifTrue: [ 0 ] ifFalse: [ each ] ].
	x := aModel atParameter: symbol.
	x isNumber ifTrue: [ ^ x ].
	x ifNil: [ 
		currentPID := aModel getPID.
		subPop := aModel population at: currentPID.
		"check if last index of currentPID = indexValue"
		currentPID last = indexValues first 
		ifTrue:  [ ^ (subPop at: symbol) currentNbIndividuals]
		ifFalse: [ ^ ((subPop parent at: (indexValues first)) at: symbol) currentNbIndividuals ].
		].
	"if x is not nil and not a number, so x is a parameter whose value is a matrix or an array, that depends on indexList"
	indexValues do: [ :each| x := (x at: each) ].
	^ x