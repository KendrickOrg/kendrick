as yet unclassified
evaluateWithModel: aModel
	| indexValues x tempKeys |
	indexValues := indexList collect: [ :each | each evaluateWithModel: aModel ].
	indexValues := indexValues
		collect: [ :each | 
			(self checkAllPositive: each)
				ifTrue: [ each ]
				ifFalse: [ 0 ] ].
	(symbol = nil) ifTrue: [ x := expression evaluateWithModel: aModel ]
	ifFalse: [  
	x := aModel atParameter: symbol.
	x isNumber
		ifTrue: [ ^ x ].
	x
		ifNil: [ tempKeys := self findKeysAt: aModel FromIndexedValues: indexValues.
			(aModel checkIndexedExpression: indexList)
				ifTrue: [ ^ self findValuesFrom: indexValues at: aModel ]
				ifFalse: [ ^ self getValueFromCompartmentsName: tempKeys at: aModel ] ].	"endof x ifNil: ["
	].
	(aModel checkIndexedExpression: indexList)
		ifTrue: [ ^ self select: indexValues from: x ]
		ifFalse: [ indexValues do: [ :each | x := x at: each ] ].
	^ x