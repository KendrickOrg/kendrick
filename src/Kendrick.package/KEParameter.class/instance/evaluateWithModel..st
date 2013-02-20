as yet unclassified
evaluateWithModel: aModel 

value := ((expression expression) evaluateWithModel: aModel).
^value.
"((expression idVariable isNil) & (expression idVariable2 isNil)) ifTrue: ["
	"beta=expr"
	"value := ((expression expression) evaluateWithModel: aModel)
	].
(expression idVariable) ifNotNil: [
	(expression idVariable2) ifNil: ["
		"beta[i]=expr"
	"	|index|
		index := (aModel atParameter: (expression idVariable))."
		"index is of type Interval"
		"index ifNotNil: [
			value := (Array new: (index size)).
			index do: [:id|
				
				]
			]
		]
	ifNotNil: [
		
		]
	]"