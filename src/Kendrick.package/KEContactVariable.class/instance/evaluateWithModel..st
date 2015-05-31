as yet unclassified
evaluateWithModel: model
	|x|
	x := model atParameter: symbol.
	x ifNil: [ 
		model population graphs do: [ :g|
			g networkOfIndividuals ifTrue: [ ^ (g nodes at: (model atParameter: #individual) id) atContact: symbol ] ] ].
	x isBlock ifTrue: [ ^ x value: model ].
	x isNumber ifTrue: [ ^ x ].
	x isExpression ifTrue: [ ^ x evaluateWithModel: model ].
	^ x 