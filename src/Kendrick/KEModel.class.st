"
A KEModel represents a mathematical model of epidemiology.
It contains a population on which the disease is studied, a list of ODEs, a list of parameters.

Instance Variables
	equations:		<OrderedCollection>
	parameters:		<Dictionary>
	population:		<KEPopulation>
	temporalParameters:		<Dictionary>
	concerns: Collection of concerns 
	
concerns:
	- a collection of concerns (this collection is not used that much in the code)
	
equations
	- a collection of ordinary differential equations

parameters
	- a collection of parameters of model

population
	- a population on which the epidemic is investigated

temporalParameters
	- beside the fixed parameter, during runtime, model will have some parameters that will be changed depending on current context. The temporalParameters variable store all these values.

"
Class {
	#name : #KEModel,
	#superclass : #KEComponent,
	#instVars : [
		'population',
		'concerns',
		't',
		'name',
		'modelName',
		'cardinalities',
		'populationCardinality'
	],
	#category : #'Kendrick-Core'
}

{ #category : #parameters }
KEModel >> addParameter: aParameter [
"A parameter is an association between a symbol and a value"
	self addParameter: aParameter key value: aParameter value
]

{ #category : #parameters }
KEModel >> addParameters: parametersCollection [
	parametersCollection
		do: [ :p | self addParameter: p ]
]

{ #category : #accessing }
KEModel >> atCompartment: anObject [
	"Return cardinality of a compartment"

	| key c |
	anObject isDictionary
		ifTrue: [ key := anObject].
	anObject isArray
		ifTrue: [ key := Dictionary newFrom: anObject ].
	key
		at: #status
		ifPresent: [ (key at: #status) = #empty
				ifTrue: [ ^ self atParameter: #N ] ].
	c := self attributes keys reject: [ :a | key keys includes: a ].
	c isEmpty
		ifTrue: [ ^ self population sizeOfACompartment: key ]
		ifFalse: [ ^ (self atAttribute: c first)
				collect: [ :e | 
					| tmp |
					tmp := key copy.
					tmp at: c first put: e.
					self population sizeOfACompartment: tmp ] ]
]

{ #category : #accessing }
KEModel >> atCompartment: keyInput put: number [

	| key |
	keyInput isDictionary | keyInput isSymbol ifTrue: [
		"Apparently we arrive here only from atCompartment:  put:  atOthersPut:"
		"This typechecking should be removed !" 
		key := keyInput ].
	keyInput isArray ifTrue: [ key := Dictionary newFrom: keyInput ].
	population compartments at: key ifAbsent: [ 
		(self finestCompartmentNames includes: key) ifFalse: [ 
			^ self error: 'No compartment names: ' , key asString ] ].
	population compartments at: key put: number
]

{ #category : #accessing }
KEModel >> atCompartment: keyInput put: aNumber1 atOthersPut: aNumber2 [

	| key |
	key := Dictionary newFrom: keyInput.
	self finestCompartmentNames do: [ :k | 
		k = key
			ifTrue: [ self atCompartment: k put: aNumber1 ]
			ifFalse: [ self atCompartment: k put: aNumber2 ] ]
]

{ #category : #parameters }
KEModel >> atParameter: aSymbol [
	|p|
	p := (self parameters at: aSymbol ifAbsent: [ nil ]).
	p ifNotNil: [ ^ p value: self ].
	^ nil
	
]

{ #category : #parameters }
KEModel >> atParameter: aSymbol assignValue: value [
	self addParameter: aSymbol value: value 
	
]

{ #category : #'as yet unclassified' }
KEModel >> attributeFromValue: aString [

attributes keysDo: [ :key | 
		  ((attributes at: key) includes: aString) ifTrue: [ ^ key ] ].
self error: aString, ' is not a value for any attribute'
]

{ #category : #accessing }
KEModel >> cardinalityOf: aSimpleCompartmentName [

	"Replaces atCompartment:"

	| compartmentName |
	populationCardinality isNotNil
	ifTrue:[
	compartmentName := KECompartmentName new
		                   simpleName: aSimpleCompartmentName
		                   withModel: self.

	^ self computeCardinalityFrom: compartmentName]
ifFalse: [ self error:'Cardinality population should be defined first' ]
]

{ #category : #accessing }
KEModel >> cardinalityOf: simpleCompartmentName setWith: number [

	"Replaces atCompartment:put:"

	| compartmentName |
	compartmentName := KECompartmentName new
		                   simpleName: simpleCompartmentName
		                   withModel: self.
	^ cardinalities at: compartmentName put: number
]

{ #category : #'as yet unclassified' }
KEModel >> computeCardinalityFrom: aKECompartmentName [

	(cardinalities includesKey: aKECompartmentName) ifTrue: [ 
		^ cardinalities at: aKECompartmentName ]
	ifFalse:[^0]
]

{ #category : #accessing }
KEModel >> concerns [
	^ concerns
]

{ #category : #'as yet unclassified' }
KEModel >> currentCompartment [
	^ self parameters at: #currentCompartment ifAbsent: [ nil ]
]

{ #category : #'as yet unclassified' }
KEModel >> currentCompartment: aCompartment [
	self parameters at: #currentCompartment put: aCompartment
]

{ #category : #'as yet unclassified' }
KEModel >> equations2 [

	| odeEquations |
	"equations2 is a temp name, we will rename it as equations later"
	odeEquations := OrderedCollection new.
	self finestCompartmentNames do: [ :compartment | 
		| equation expression |
		equation := KEEquation new
			            variable: compartment associations;
			            tVariable: #t.
		expression := nil.
		"TBD: we should build the expression here"
		self transitions do: [ :tr | "expression to be added from one compartment"
			tr from associations = compartment associations ifTrue: [ 
				| exp |
				exp := KEBinaryExpression new
					       op: #*;
					       leftHandSide: tr probability;
					       rightHandSide: tr from associations.
				expression isNil
					ifTrue: [ expression := exp ]
					ifFalse: [ 
						expression := KEBinaryExpression new
							              op: #+;
							              leftHandSide: expression;
							              rightHandSide: exp ] ].
			"expression to be removed from one compartment"
			tr to associations = compartment associations ifTrue: [ 
				| exp |
				exp := KEBinaryExpression new
					       op: #*;
					       leftHandSide: tr probability;
					       rightHandSide: tr from associations.
				expression isNil
					ifTrue: [ expression := exp negated ]
					ifFalse: [ 
						expression := KEBinaryExpression new
							              op: #+;
							              leftHandSide: expression;
							              rightHandSide: exp negated ] ] ].
		equation expression: expression.
		odeEquations add: equation ].

	self halt.
	^ odeEquations
]

{ #category : #'as yet unclassified' }
KEModel >> executeEventAtRateIndex: anInteger [

(self transitions at: anInteger ) executeOn: self times: 1.
]

{ #category : #'as yet unclassified' }
KEModel >> gtInspectorKendrickGraphInRoassal3: composite [
	<gtInspectorPresentationOrder: -10>
	<gtInspectorTag: #kendrick>
	^ ((Composition Temp concern: self id) instVarNamed: #backEndEntity) gtInspectorViewInRoassal3: composite
]

{ #category : #'as yet unclassified' }
KEModel >> gtInspectorViewInRoassal3: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'View';
		initializeCanvas: [ self visualize  ]
]

{ #category : #initialization }
KEModel >> initialize [

	super initialize.
	t := 0.
	self addParameter: #N value: [ :aModel | aModel population size ].
	self addParameter: #t value: [ :aModel | aModel t ].
	concerns := OrderedCollection new.
	population := KEPopulation new.
	cardinalities := Dictionary new.
]

{ #category : #initialization }
KEModel >> initializeCompartments [
	"Initialize compartments with cardinalities at 0"

	population compartments: (Dictionary
		newFrom: (self finestCompartmentNames collect: [ :c | c -> 0 ]))
]

{ #category : #accessing }
KEModel >> integrate: aConcern [
	concerns add: aConcern.
	self transitions: (aConcern generateTensorSum: self transitions).
	aConcern attributes
		keysAndValuesDo: [ :k :v | self addAttribute: k value: v ].
	aConcern parameters
		keysAndValuesDo: [ :k :v | self addParameter: k value: v ].
	self population reset.
	
	"Need to reinitialize the compartments because integrate: change the compartments"
	"If we have a tensor sums between 2 models that generate a new model should not be necessary anymore"
	self initializeCompartments 
]

{ #category : #modelName }
KEModel >> modelName [
	^ modelName
]

{ #category : #'name:' }
KEModel >> modelName: aString [ 
	modelName := aString
]

{ #category : #accessing }
KEModel >> name [
	^ String
		streamContents: [ :stream | 
			(STON writer on: stream)
				prettyPrint: false;
				jsonMode: true;
				referencePolicy: #error;
				nextPut: population compartments ]
]

{ #category : #'as yet unclassified' }
KEModel >> nextCompartment [

	^ self parameters at: #nextCompartment ifAbsent: [ nil ]
]

{ #category : #'as yet unclassified' }
KEModel >> nextCompartment: aCompartment [
	self parameters at: #nextCompartment put: aCompartment
]

{ #category : #accessing }
KEModel >> population [
	population ifNil: [ population := KEPopulation new ].
	^ population
]

{ #category : #accessing }
KEModel >> population: aPopulation [
	population := aPopulation
]

{ #category : #accessing }
KEModel >> populationCardinality [
	^ populationCardinality 
]

{ #category : #accessing }
KEModel >> populationCardinality: aNumber [

populationCardinality := aNumber
]

{ #category : #accessing }
KEModel >> rates [
	^ transitions
		collect: [ :tr | 
			| prob |
			(tr from at: #status) = #empty
				ifTrue: [ self currentCompartment: tr to ]
				ifFalse: [ self currentCompartment: tr from ].
			self nextCompartment: tr to.
			prob := (tr probability value: self) abs.
			prob * (self atCompartment: tr from) ]
]

{ #category : #accessing }
KEModel >> sizeOfPopulation: aCompartmentArray [

	"aCompartmentArray describe a subpopulation like {#S. #human. #female}. Returns the cardinality of compartments that verify this property
	call sizeOfPopulation: on the population"

	^ self population sizeOfPopulation: aCompartmentArray
]

{ #category : #accessing }
KEModel >> t [
	^ t
]

{ #category : #accessing }
KEModel >> t: aNumber [
	t := aNumber
]

{ #category : #accessing }
KEModel >> visualize [
		
	|graph c nodes edges|
	c := RSCanvas new.
	c color: Color gray.
	
	graph := (KEGraphFromCompartments on: self) run.
	nodes := graph nodes collect: [ :l | 
	| label box |
	label := RSLabel new 
		text: l;
		color: Color white;
		yourself.
	
	box := RSBox new
		extent: label extent + 5;
		color: '#235959';
		model: l;
		border: (RSBorder new color: '#2c80ff'; yourself);
		yourself.
		
	{ box. label } asGroup asShapeFor: l] as: RSGroup.
	nodes @ RSDraggable.
	c addAll: nodes.
	
   RSFlowLayout on: nodes. 
 
	edges := RSEdgeBuilder arrowedDirectedBezier 
			color: Color red;
			canvas: c;
			shapes: c shapes;
			withBorderAttachPoint;
			attachPoint: (RSHorizontalAttachPoint new );
	source: graph edges connectFrom: #from to: #to. 
				
	c @ RSCanvasController.
   ^c 
]
