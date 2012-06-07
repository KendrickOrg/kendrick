as yet unclassified
evaluateWithModel: aModel

| expressionValue |
expressionValue := exprInFunction evaluateWithModel: aModel.

(function = #sin) ifTrue: [^(expressionValue sin)].
(function = #cos) ifTrue: [^(expressionValue cos)].
(function = #log) ifTrue: [^(expressionValue log)].