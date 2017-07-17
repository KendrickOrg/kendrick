as yet unclassified 
acceptKEEQuation: aNode
	|aStream strTmp index allEquations|
	aStream := WriteStream on: (String new: 60).
	strTmp := WriteStream on: (String new: 60).
	strTmp nextPutAll: (self visitNode: aNode expression).
	"defSumSigma := false."
	allEquations := (self model) equations.
	
	"ThanhNT 10/7"
	"Check index of Equation"
	"index := 0.
	found := false.
	allEquations do: [ :each|
		each = aNode ifFalse: [ 
								found ifFalse: [ index := index + 1 ].
			 				]
				ifTrue:	[ 
					found ifFalse: [ found := true ].
					 ].
		 ]."
	index := self checkSymbol: (aNode variable).
	"Endof ThanhNT 10/7"
	equaChecks at: (aNode variable symbol) ifAbsent: [ 
		equaChecks at: (aNode variable symbol) put: 1.
		"ThanhNT 10/7"
		"Dont care about nbOfSpecies (?)"
		"aStream nextPutAll: String tab, 'for (int i = 0; i < nbOfSpecies; i++)';cr."
		"aStream nextPutAll: String tab, '{';cr."
		"Endof ThanhNT 10/7"
		strInitializeKEMath ifNotNil: [ 
			aStream nextPutAll: (strInitializeKEMath contents).
			strInitializeKEMath := nil.
			].
		].
		aStream nextPutAll: String tab, 'rates[', index asString, '] = '.
		"aStream nextPutAll: String tab, String tab, 'dxdt(', (compartments at: aNode variable symbol) asString, ', i) = '."
		aStream nextPutAll: strTmp contents, ';';cr.
		"ThanhNT 10/7"
		"Because the above '{' is set comment so this following '}' should be removed as well"
		"aStream nextPutAll: String tab, '}';cr."
		"Endof ThanhNT 10/7"
		 "]."
	^ aStream contents