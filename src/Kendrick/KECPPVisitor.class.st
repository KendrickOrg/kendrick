"
A KECPPVisitor is a visitor that generates code C/C++ for the model specified in Kendrick, depending on the algorithm determined by user.

Instance Variables
	compartments:		<Object>
	defSumSigma:		<Object>
	equaChecks:		<Object>
	eventIndex:		<Object>
	function:		<Object>
	isDeterministic:		<Object>
	nbOfCompartments:		<Object>
	numberOfEvent:		<Object>
	parameters:		<Object>
	rateOfListEvent:		<Object>
	strInitializeKEMath:		<Object>
	strInitializeTrans:		<Object>
	stream:		<Object>

compartments
	- xxxxx

defSumSigma
	- xxxxx

equaChecks
	- xxxxx

eventIndex
	- xxxxx

function
	- xxxxx

isDeterministic
	- xxxxx

nbOfCompartments
	- xxxxx

numberOfEvent
	- xxxxx

parameters
	- xxxxx

rateOfListEvent
	- xxxxx

strInitializeKEMath
	- xxxxx

strInitializeTrans
	- xxxxx

stream
	- xxxxx

"
Class {
	#name : #KECPPVisitor,
	#superclass : #KEVisitor,
	#instVars : [
		'stream',
		'compartments',
		'nbOfCompartments',
		'parameters',
		'equaChecks',
		'rateOfListEvent',
		'numberOfEvent',
		'strInitializeTrans',
		'strInitializeKEMath',
		'function',
		'isDeterministic',
		'eventIndex',
		'defSumSigma'
	],
	#classInstVars : [
		'aNode'
	],
	#category : 'Kendrick-Code-Generators'
}

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKEBinaryExpression: aKEBExpNode [
| aStream |
aStream := WriteStream on: (String new: 60).
aStream nextPutAll: '('.
aStream nextPutAll: (self visitNode: aKEBExpNode leftHandSide).
aStream nextPutAll: aKEBExpNode op.
aStream nextPutAll: (self visitNode: aKEBExpNode rightHandSide).
aStream nextPutAll: ')'.
^ aStream contents
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKECompartment: aNode [
	|aStream|
	aStream := WriteStream on: (String new: 60).
	compartments at: aNode status put: nbOfCompartments.
	nbOfCompartments := nbOfCompartments + 1.	
	aStream nextPutAll: String tab, 'compartmentName[', (compartments at: aNode status) asString, '] = "', aNode status asString, '";';cr.
	1 to: (aNode numberOfSpecies) do: [ :each|
		aStream nextPutAll: String tab, 'initialValue[', (compartments at: aNode status) asString, '][', (each-1) asString, '] = ', (aNode initialValue at: each) asString, ';';cr.
		 ].	
	^ aStream contents.
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKEDeterministicSimulator: aNode [
	|aStream|
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: 'void solverDeterministic()';cr.
	aStream nextPutAll: '{';cr.
	aStream nextPutAll: String tab,'state_type x(nbOfCompartments, nbOfSpecies, 0.0);';cr.
	aStream nextPutAll: String tab, 'double t = tMin;';cr.
	aStream nextPutAll: String tab, 'stringstream fname;';cr.
	aStream nextPutAll: String tab, 'fname << "data_";';cr.
	aStream nextPutAll: String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	aStream nextPutAll: String tab, String tab, 'fname << compartmentName[i];';cr.
	aStream nextPutAll: String tab, 'fname << "_det.dat";';cr.
	aStream nextPutAll: String tab, 'ofstream f(fname.str().data());';cr.
	aStream nextPutAll: String tab,'for (int i = 0; i < nbOfCompartments; i++)';cr.
	aStream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'x(i, j) = initialValue[i][j];';cr.
	aStream nextPutAll: String tab, 'if (f.is_open())';cr.
	aStream nextPutAll: String tab, '{';cr.
	aStream nextPutAll: String tab, String tab, 'while (t <= tMax)';cr.
	aStream nextPutAll: String tab, String tab, '{';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'f << t << ''\t'';';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'rk4.do_step(initializeEquations, x, t, tStep);';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'for (int i = 0; i < nbOfCompartments; i++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, '{';cr.
	aStream nextPutAll: String tab, String tab, String tab, String tab, String tab, 'f << ', function asString, '(x(i, j)) << ''\t'';';cr.
	"aStream nextPutAll: String tab, String tab, String tab, String tab, 'chartManager[i][j].addPoint(', function asString, '(x(i, j)));' ;cr.	"
	aStream nextPutAll: String tab, String tab, String tab, String tab, '}';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'f << ''\n'';';cr.
	aStream nextPutAll: String tab, String tab, 't += tStep;';cr.
	aStream nextPutAll: String tab, String tab, '}';cr.
	aStream nextPutAll: String tab, String tab, 'f.close();';cr.
	aStream nextPutAll: String tab, '}';cr.
	"aStream nextPutAll: String tab,'for (int i = 0; i < nbOfCompartment; i++)';cr.
	aStream nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	aStream nextPutAll: String tab, String tab, String tab, 'chartManager[i][j].drawChart(compartmentName[i], j+1, tMin, tMax, tStep);' ;cr."
	aStream nextPutAll: '}';cr;cr.
	^ aStream contents.
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKEEQuation: aNode [
	|aStream strTmp|
	aStream := WriteStream on: (String new: 60).
	strTmp := WriteStream on: (String new: 60).
	strTmp nextPutAll: (self visitNode: aNode expression).
	defSumSigma := false.
	equaChecks at: (aNode variable symbol) ifAbsent: [ 
		equaChecks at: (aNode variable symbol) put: 1.
		aStream nextPutAll: String tab, 'for (int i = 0; i < nbOfSpecies; i++)';cr.
		aStream nextPutAll: String tab, '{';cr.
		strInitializeKEMath ifNotNil: [ 
			aStream nextPutAll: (strInitializeKEMath contents).
			strInitializeKEMath := nil.
			].
		aStream nextPutAll: String tab, String tab, 'dxdt(', (compartments at: aNode variable symbol) asString, ', i) = '.
		aStream nextPutAll: strTmp contents, ';';cr.
		aStream nextPutAll: String tab, '}';cr.
		 ].
	^ aStream contents
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKEEvent: anEventNode [
	| aStream string string2  |
	string :=''.
	string2:=''.
	aStream := WriteStream on: (String new: 60).
	anEventNode eqIndexVar ifNotNil: [ eventIndex := (anEventNode eqIndex) - 1 ].		
	string := String tab, string, 'rates[', (numberOfEvent ) asString ,'] = '.
	string := string, (self visitNode: anEventNode rate), ';'. 	
	strInitializeKEMath ifNotNil: [ 
		aStream nextPutAll: (strInitializeKEMath contents).
		strInitializeKEMath := nil.
		 ].	
	strInitializeTrans nextPutAll: String tab, String tab, 'case ', (numberOfEvent asString), ':';cr.	
	anEventNode actions keysAndValuesDo: [:name :value|
		string2 := (self visitNode: name).
		value > 0 ifTrue: [ strInitializeTrans nextPutAll: String tab, String tab, String tab, string2 , '=', string2, '+', value asString,';' ;cr].
		value < 0 ifTrue: [ strInitializeTrans nextPutAll: String tab, String tab, String tab, string2 , '=', string2, value asString,';' ;cr]			
	].
	strInitializeTrans nextPutAll:String tab, String tab, String tab, 'break;';cr.
	
	numberOfEvent := numberOfEvent +1.
	eventIndex := -1.	
	aStream nextPutAll: string;cr.
	^ aStream contents
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKEIndexedVariable:  aNode [ 
	|k aStream |
	aStream := WriteStream on: (String new: 60).
	k := parameters at: (aNode symbol) ifAbsent: [nil]. 
	k ifNil: [ 	
		isDeterministic ifTrue: [ aStream nextPutAll: 'x(', (compartments at: aNode symbol) asString, ', ', aNode idExpression1 asString, ')' ]	
		ifFalse: [ aStream nextPutAll: 'x[', (compartments at: aNode symbol) asString, '][', aNode idExpression1 asString, ']' ]
	] 
	   ifNotNil:  [ 
	((aNode idExpression2 isNumerical) and:[aNode idExpression2 number = -1])
	ifTrue: [ 
		aStream nextPutAll: aNode symbol asString, '[',  aNode  idExpression1 asString ,']' 
		]
	ifFalse: [
		aStream nextPutAll: aNode symbol asString, '[',  aNode  idExpression1 asString ,'][', aNode  idExpression2 asString , ']'
		]
	 ].
	^ aStream contents
		

]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKEMathExpression: aNode [
	|aStream|
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: (aNode functionName asString).
	(aNode functionExpr class == KEVariable) | (aNode functionExpr class == KENumerical) 
		ifTrue: [ aStream nextPutAll: '(' ].
	aStream nextPutAll: (self visitNode: aNode functionExpr).
	(aNode functionExpr class == KEVariable) | (aNode functionExpr class == KENumerical) 
		ifTrue: [ aStream nextPutAll: ')' ].
	^ aStream contents
	
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKEMathExpressionSigma: aNode [
	|aStream|
	aStream := WriteStream on: (String new: 60).
	strInitializeKEMath := WriteStream on: (String new: 60).
	aNode idVariable = #j ifFalse: [ aNode idVariable = #j ].
	defSumSigma ifFalse: [ strInitializeKEMath nextPutAll: String tab, String tab, 'double sumSigma = 0.0;';cr ]
				    ifTrue: [ strInitializeKEMath nextPutAll: String tab, String tab, 'sumSigma = 0.0;';cr  ].
	strInitializeKEMath nextPutAll: String tab, String tab, 'for (int j = 0; j < nbOfSpecies; j++)';cr.
	strInitializeKEMath nextPutAll: String tab, String tab, String tab, 'sumSigma += '.
	strInitializeKEMath nextPutAll: (self visitNode: aNode functionExpr), ';';cr.
	defSumSigma := true.
	aStream nextPutAll: 'sumSigma'.
	^ aStream contents
	
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKEModel: aNode [
	self subclassResponsibility

]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKENumerical: aKENNode [
	| aStream |
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: (aKENNode number) asString.
	^ aStream contents
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKEParameter: aNode [
	| aStream |
	aStream := WriteStream on: (String new: 60).
	parameters at: aNode symbol put: aNode value.
	aNode value isInterval ifTrue: [ ^ aStream contents ].
	aNode value isArray ifTrue: [ 
		aStream nextPutAll: 'const double ', aNode symbol asString.
		aStream nextPutAll: (self prepareArray: aNode value).
		aStream nextPutAll: (self printArray: aNode value).
		aStream nextPutAll: ';';cr.
		 ]
	ifFalse: [ 
		aStream nextPutAll: 'const double ', aNode symbol asString, ' = ', aNode value asFloat asString, ';';cr.
		 ].	
	"Another case: aNode value is nil and aNode expression is an Expression"
	^ aStream contents
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKETransition: aTransitionNode [ 
	|aStream string1 fromStatus toStatus|
	string1 := ''.
	aStream := WriteStream on: (String new: 60).
	aTransitionNode eqIndexVar ifNotNil: [ eventIndex := (aTransitionNode eqIndex) - 1 ].	
	string1 := String tab, string1, 'rates[', (numberOfEvent asString), '] = '.
	string1 := string1, (self visitNode: aTransitionNode rate), ';'.
	strInitializeKEMath ifNotNil: [ 
		aStream nextPutAll: (strInitializeKEMath contents).
		strInitializeKEMath := nil.
		 ].		
	fromStatus := ''.
	aTransitionNode fromStatus ifNotNil: [ fromStatus := aTransitionNode fromStatus symbol asString ].
	toStatus := ''.
	aTransitionNode toStatus ifNotNil: [ toStatus := aTransitionNode toStatus symbol asString. ].		
	strInitializeTrans nextPutAll: String tab, 'listOfTransitions[', (numberOfEvent asString), '].fromStatus = "', fromStatus, '";';cr.
	strInitializeTrans nextPutAll: String tab, 'listOfTransitions[', (numberOfEvent asString), '].toStatus = "', toStatus, '";';cr.
	strInitializeTrans nextPutAll: String tab, 'listOfTransitions[', (numberOfEvent asString), '].specieID = ', aTransitionNode eqIndex asString, ';';cr.
	
	numberOfEvent := numberOfEvent + 1.
	eventIndex := -1.	
	aStream nextPutAll: string1;cr.
	^ aStream contents
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKEUnaryExpression: aNode [
	| aStream |
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: '('.
	aStream nextPutAll: aNode op.
	aStream nextPutAll: (self visitNode: aNode expression).
	aStream nextPutAll: ')'.
	^ aStream contents
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> acceptKEVariable: aNode [
	|k aStream |
	aStream := WriteStream on: (String new: 60).
	aNode symbol == #t ifTrue: [ 
		aStream nextPutAll: (aNode symbol asString). 
		^ aStream contents
		].
	k := parameters at: (aNode symbol) ifAbsent: [nil]. 		
	k ifNil: [ 
		compartments at: (aNode symbol) ifAbsent: [ 
			aStream nextPutAll: (aNode symbol asString). 
			^ aStream contents. 
			].
		isDeterministic ifTrue: [ aStream nextPutAll: 'x(' , (compartments at: aNode symbol) asString , ', 0)' ]		
		ifFalse: [ aStream nextPutAll: 'x[' , (compartments at: aNode symbol) asString , '][0]' ]
	] ifNotNil:  [ 
		aStream nextPutAll: aNode symbol asString
		].
	^ aStream contents

]

{ #category : #'as yet unclassified' }
KECPPVisitor >> compartments [
	^ compartments
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> contents [
	^ stream contents
]

{ #category : #accessing }
KECPPVisitor >> function: anObject [
	function := anObject
]

{ #category : #accessing }
KECPPVisitor >> functionName [
	^ function
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> getFileName: aModel [
	|aStream|
	aStream := WriteStream on: (String new: 10).
	aModel compartments do: [:each|
		aStream nextPutAll: (each status asString)
		].
	aStream nextPutAll: '.cpp'.
	^ aStream contents
	
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> initialize [
	super initialize.
	stream := WriteStream on: (String new: 60).
	strInitializeTrans := WriteStream on: (String new: 60).		
	compartments := Dictionary new.
	parameters := Dictionary new.
	equaChecks := Dictionary new.
	nbOfCompartments := 0.
	eventIndex := -1.
	defSumSigma := false.
	isDeterministic := true.
	function := ''.

	

]

{ #category : #'as yet unclassified' }
KECPPVisitor >> nbOfCompartments [
	^ nbOfCompartments
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> parameters [ 
	^ parameters 
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> prepareArray: anArray [ 
	|aStream|
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: '[', anArray size asString, ']'.
	(anArray at: 1) isArray ifTrue: [ aStream nextPutAll: (self prepareArray: (anArray at: 1)) ]
	ifFalse: [ aStream nextPutAll: ' = ' ].
	^ aStream contents
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> printArray: anArray [ 
	|aStream count|
	aStream := WriteStream on: (String new: 60).
	aStream nextPutAll: '{'.
	count := 0.
	anArray do: [ :each|
		count := count + 1.
		each isArray ifTrue: [ aStream nextPutAll: (self printArray: each) ]
		ifFalse: [ aStream nextPutAll: each asFloat asString ].
		count = (anArray size) ifFalse: [ aStream nextPutAll: ', ' ].			
		 ].
	aStream nextPutAll: '}'.
	^ aStream contents
	
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> visit: model algorithm: algorithm [
	algorithm = #RK4 ifTrue: [ ^ (KECPPRK4Visitor new) visitNode: model ].
	algorithm = #Gillespie ifTrue: [ ^ (KECPPGillespieDirectVisitor new) visitNode: model ].
	algorithm = #ExplicitTauLeap ifTrue: [ ^ (KECPPExplicitTauLeapVisitor new) visitNode: model ].
	algorithm = #IBM ifTrue: [ ^ (KECPPIndividualBasedVisitor new) visitNode: model ] 
]

{ #category : #'as yet unclassified' }
KECPPVisitor >> visitNode: aNode [
	aNode class == KENumerical
		ifTrue: [ ^ self acceptKENumerical: aNode ].
	aNode class == KEModel
		ifTrue: [ ^ self acceptKEModel: aNode ].
	aNode class == KEVariable
		ifTrue: [ ^ self acceptKEVariable: aNode ].
	aNode class == KEBinaryExpression
		ifTrue: [ ^ self acceptKEBinaryExpression: aNode ].
	aNode class == KECompartment
		ifTrue: [ ^ self acceptKECompartment: aNode ].
	aNode class == KEEquation
		ifTrue: [ ^ self acceptKEEQuation: aNode ].
	aNode class == KEParameter
		ifTrue: [ ^ self acceptKEParameter: aNode ].
	aNode class == KEUnaryExpression
		ifTrue: [ ^ self acceptKEUnaryExpression: aNode ].
	aNode class == KEDeterministicSimulator
		ifTrue: [ ^ self acceptKEDeterministicSimulator: aNode ].
	aNode class == KEMathFunctionExpression 
		ifTrue: [ ^ self acceptKEMathExpression: aNode ].
	aNode  class == KESigmaFunctionExpression
		ifTrue: [ ^ self acceptKEMathExpressionSigma: aNode ].
	aNode  class == KEIndexedVariable 
		ifTrue: [ ^ self acceptKEIndexedVariable: aNode ].
	aNode  class == KEEventOld
		ifTrue: [ ^ self acceptKEEvent:  aNode].
	aNode class == KETransition 
		ifTrue: [ ^ self acceptKETransition: aNode ].
]
