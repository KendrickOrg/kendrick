as yet unclassified
evaluateWithModel: aModel
	|indexValues x currentPID subPop|
	indexValues := indexList collect: [ :each| each evaluateWithModel: aModel ].
	indexValues := indexValues collect: [ :each| each < 0 ifTrue: [ 0 ] ifFalse: [ each ] ].
	x := aModel atParameter: symbol.
	x isNumber ifTrue: [ ^ x ].
	x ifNil: [ 
		currentPID := aModel temporalParameters at: #PID.
		subPop := aModel population atSubPopulation: currentPID.
		"check if last index of currentPID = indexValue"
		currentPID last = indexValues first 
		ifTrue:  [ ^ (subPop atSubPopulation: symbol) currentNbIndividuals]
		ifFalse: [ ^ ((subPop superPopulation atSubPopulation: (indexValues first)) atSubPopulation: symbol) currentNbIndividuals ].
		].
	"if x is not nil and not a number, so x if a value of a matrix or an array, that depends on indexList"
	indexValues do: [ :each| x := (x at: each) ].
	^ x