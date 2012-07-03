as yet unclassified
addEquation: anEquation

| index equation|
(anEquation idVariable) ifNotNil: [index := (parameters at: (anEquation idVariable) ifAbsent: nil)].
"self halt."
index ifNotNil: [
	"index is an interval, ex: index := (1 to: 10)"
	index do: [:id|
		equation := (KEEquationExtended new) variable: (anEquation variable); tVariable: (anEquation tVariable); expression: (anEquation expression); eqIndex: id; idVariable: (anEquation idVariable).
		"Transcript show: (equation eqIndex);cr."
		equations add: equation.
		]	
	] ifNil: [
		Transcript show: 'Index is nul'; cr.
		equations add: anEquation.
	]



