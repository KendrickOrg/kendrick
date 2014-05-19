adding
addEquation: anEquation
	equations add:anEquation.
"| index|
(anEquation idVariable) ifNotNil: [index := (self atParameter: (anEquation idVariable))].

index ifNotNil: [
	
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
		
		equations add: anEquation.
	]."


