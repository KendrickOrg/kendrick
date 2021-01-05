"
A KEModel represents a mathematical model of epidemiology.
It contains a population on which the disease is studied, a list of ODEs, a list of parameters.

Instance Variables
	equations:		<OrderedCollection>
	parameters:		<Dictionary>
	population:		<KEPopulation>
	temporalParameters:		<Dictionary>

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
		't'
	],
	#category : #'Kendrick-Core'
}

{ #category : #adding }
KEModel >> addParameter: aParameter [
"A parameter is an association between a symbol and a value"
	self addParameter: aParameter key value: aParameter value
]

{ #category : #adding }
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
	keyInput isDictionary | keyInput isSymbol
		ifTrue: [ key := keyInput ].
	keyInput isArray
		ifTrue: [ key := Dictionary newFrom: keyInput ].
	population compartments
		at: key
		ifAbsent: [(self compartmentNames includes: key)
				ifFalse: [ ^ self error: 'No compartment names: ' , key asString ].
		 ].
		population compartments at:key put: number.
	
]

{ #category : #accessing }
KEModel >> atCompartment: keyInput put: aNumber1 atOthersPut: aNumber2 [
	| key |
	keyInput isDictionary | keyInput isSymbol
		ifTrue: [ key := keyInput ].
	keyInput isArray
		ifTrue: [ key := Dictionary newFrom: keyInput ].
		self compartmentNames 
		do: [ :k | 
			k = key
				ifTrue: [ self atCompartment: k put: aNumber1 ]
				ifFalse: [ self atCompartment: k put: aNumber2 ] ]
]

{ #category : #accessing }
KEModel >> atParameter: aSymbol [
	|p|
	p := (self parameters at: aSymbol ifAbsent: [ nil ]).
	p ifNotNil: [ ^ p value: self ].
	^ nil
	
]

{ #category : #accessing }
KEModel >> atParameter: aSymbol assignValue: value [
	self addParameter: aSymbol value: value 
	
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
KEModel >> gtInspectorGraphIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite roassal2
		title: 'Transition Graph View';
		painting: [ :view | 
			| graph lab nodes |
			graph := (KEGraphFromCompartments on: self) run.
			lab := RTLabel new.
			nodes := (RTBox new
				size: 40;
				color: (Color blue alpha: 0.4)) + (lab text: [ :e | e model associations asString ]) elementsOn: graph nodes.
			nodes @ RTDraggable.
			view addAll: nodes.
			RTEdgeBuilder new
				view: view;
				shape:
					(RTArrowedLine new
						color: Color black;
						attachPoint: RTBorderAttachPoint new);
				labelElement: [ :e | 'rate' ] fontSize: 12;
				source: graph edges connectFrom: #from to: #to.
			(RTLayoutBuilder new forceWithCharge: -300) on: view elements.
			view ]
]

{ #category : #'*Kendrick-InternalDSL-DSL' }
KEModel >> gtInspectorKendrickGraphIn: composite [
	<gtInspectorPresentationOrder: -20>
	<gtInspectorTag: #kendrick>
	composite roassal2
		title: 'Graph';
		painting: [ :view | 
			| graph lab nodes |
			graph := (KEGraphFromCompartments on: self) run.
			lab := RTLabel new.
			nodes := (RTEllipse new
				size: 15;
				color: (Color blue alpha: 0.4)) + (lab text: [ :e | e model associations.  ]) elementsOn: graph nodes.
			nodes @ RTDraggable.
			view addAll: nodes.
			RTEdgeBuilder new
				view: view;
				shape:
					(RTArrowedLine new
						color: Color black;
						attachPoint: RTBorderAttachPoint new);
				source: graph edges connectFrom: #from to: #to.
			(RTLayoutBuilder new forceWithCharge: -450) on: view elements.
			view ]
]

{ #category : #initialization }
KEModel >> initialize [
	super initialize.
	t := 0.
	self addParameter: #N value: [ :aModel | aModel population size ].
	self addParameter: #t value: [ :aModel | aModel t ].
	concerns := OrderedCollection new.
	population := KEPopulation new.
]

{ #category : #initialization }
KEModel >> initializeCompartments [
	"Initialize compartments with cardinalities at 0"

	population compartments: (Dictionary
		newFrom: (self compartmentNames collect: [ :c | c -> 0 ]))
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
