as yet unclassified
evaluateWithModel: aModel
	|indexValues x  tempKeys |
	indexValues := indexList collect: [ :each| each evaluateWithModel: aModel ].
	"ThanhNT 19/7"
	"indexValues := indexValues collect: [ :each| each < 0 ifTrue: [ 0 ] ifFalse: [ each ] ]."
	indexValues := indexValues collect: [ :each| (self checkAllPositive: each) ifTrue: [ each ] ifFalse: [ 0 ] ].
	"Endof ThanhNT 19/7"
	x := aModel atParameter: symbol.
	x isNumber ifTrue: [ ^ x ].
	x ifNil: [ 
		"currentPID := aModel currentPopulationID."
		"ThanhNT 13-July-2017"

		tempKeys := self findKeysFromIndexedVariable: aModel at: (indexValues).
	
		"ThanhNT 30-July-2017"
		(aModel checkIndexedExpression: indexList ) ifTrue: [ 
				^(self findValuesFrom: indexValues at: aModel).
		 	]
			ifFalse: [  
				^(self getValueFromCompartmentsName: tempKeys at: aModel).
			]
		"Endof ThanhNT 30-July-2017"
		"Endof ThanhNT 13-July-2017"
		]."endof x ifNil: ["
	"ThanhNT 20-July-2017"
	"Reason: the old statement cant handle indexValues which is"
	"multi-dimension array"
	"indexValues do: [ :each| x := (x at: each) ]."
	(aModel checkIndexedExpression: indexList ) ifTrue: [ 
			|result|
			result := self select: indexValues from: x.
			^result.
		 ]
	ifFalse: 
		[
			indexValues do: [ :each| x := (x at: each) ].
		].
	"Endof ThanhNT 20-July-2017"
	^ x.