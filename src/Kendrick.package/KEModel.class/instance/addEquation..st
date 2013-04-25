adding
addEquation: anEquation

"equations add:anEquation."
| index|
(anEquation idVariable) ifNotNil: [index := (self atParameter: (anEquation idVariable))].
"self halt."
index ifNotNil: [
	"index is an interval, ex: index := (1 to: 10)"
	index do: [:id|
		|equation|
		equation := (KEEquation new) 
						variable: (anEquation variable); 
						tVariable: (anEquation tVariable); 
						expression: (anEquation expression); 
						idVariable: (anEquation idVariable); 
						eqIndex: id.
		equations  add: equation.
		]	
	] ifNil: [
		"Transcript show: 'Index is nul'; cr."
		equations add: anEquation.
	].


