as yet unclassified
evaluateWithModel: aModel
	|indexValues x popIndexList subPop|
	indexValues := indexList collect: [ :each| each evaluateWithModel: aModel ].
	indexValues := indexValues collect: [ :each| each < 0 ifTrue: [ 0 ] ifFalse: [ each ] ].
	x := aModel atParameter: symbol.
	x isNumber ifTrue: [ ^ x ].
	x ifNil: [ 
		popIndexList := aModel temporalParameters at: #PID ifAbsent: [ nil ].
		popIndexList ifNotNil: [ 
			subPop := aModel population atSubPopulation: popIndexList.
			^ ((subPop atSubPopulation: indexValues) atSubPopulation: symbol) currentNbIndividuals
			 ].
		^ ((aModel population atSubPopulation: indexValues) atSubPopulation: symbol) currentNbIndividuals
		 ].
	"if x is not nil and not a number, so x if a value of a matrix or an array, that depends on indexList"
	indexValues do: [ :each| x := (x at: each) ].
	^ x