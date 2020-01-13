"
A KEModel represents a mathematical model of epidemiology. It contains a population on which the disease is studied, a list of ODEs, a list of common parameters and a simulator.

Instance Variables
	equations:		<OrderedCollection>
	parameters:		<Dictionary>
	population:		<KEPopulation>
	populationIDs:		<OrderedCollection>
	temporalParameters:		<Dictionary>

equations
	- a list of odinary differential equations of mathematical model

parameters
	- a list of common parameters of model

population
	- a population on which the epidemic is investigated

populationIDs
	- each sub-population in population has an ID. This variable gets all the sub-population IDs

temporalParameters
	- Beside the fixed parameter, during runtime, model will have some parameters that will be changed depending on current context. The temporalParameters variable store all these values.

"
Class {
	#name : #KEModel,
	#superclass : #KEComponent,
	#instVars : [
		'population',
		'initCompartments',
		'concerns',
		't'
	],
	#category : #'Kendrick-Core'
}

{ #category : #adding }
KEModel >> addParameter: input [
	self addParameter: input key value: input value
	
]

{ #category : #adding }
KEModel >> addParameters: input [
	input do: [ :e| self addParameter: e key value: e value ]
	
	
]

{ #category : #accessing }
KEModel >> atCompartment: anObject [
	| key c |
	"anObject = #empty
		ifTrue: [ ^ self atParameter: #N ]."
	anObject isDictionary
		ifTrue: [ key := anObject ].
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
	self initCompartments
		at: key
		ifAbsent: [ (self compartmentNames includes: key)
				ifFalse: [ ^ self error: 'No compartment names: ' , key asString ].
			initCompartments := Dictionary newFrom: (self compartmentNames collect: [ :c | c -> 0 ]) ].
	"population initialSize < (initCompartments values sum + number)
		ifTrue: [ ^ self error: 'Total size of compartments is greater than the population size' ]."
	initCompartments at: key put: number.
	population compartments: initCompartments
]

{ #category : #accessing }
KEModel >> atCompartment: keyInput put: aNumber1 atOthersPut: aNumber2 [
	| key |
	keyInput isDictionary | keyInput isSymbol
		ifTrue: [ key := keyInput ].
	keyInput isArray
		ifTrue: [ key := Dictionary newFrom: keyInput ].
	self initCompartments
		keysDo: [ :k | 
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
KEModel >> atStatus: aSymbol put: aNumber [
	|nb coms|
	(self atAttribute: #status) ifNil: [ ^ self error: 'The model does not contain the attribute #status' ].
	((self atAttribute: #status) includes: aSymbol) ifFalse: [ ^ self error: 'THe model does not contain the status', aSymbol asString ].
	self initCompartments ifNil: [ initCompartments := Dictionary newFrom: (self compartmentNames collect: [:c| c->0]) ].
	(population initialSize < (initCompartments values sum + aNumber)) ifTrue: [ ^ self error: 'Total size of compartments is greater than the population size' ].
	coms := (initCompartments keys select: [ :k| (k at: #status) = aSymbol ]).
	nb :=  coms size.
	((aNumber \\ nb) > 0) ifTrue: [  
		1 to: (aNumber \\ nb) do: [ :i| 
			initCompartments at: (coms at: i) put: ((aNumber // nb) + 1) ]
		].
	((aNumber \\ nb)+1) to: nb do: [ :i| initCompartments at: (coms at: i) put: (aNumber // nb) ].
	population compartments: initCompartments
	
	
	
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
KEModel >> generateEvents [
	| eventGenerator  events |
	eventGenerator := KEEventGenerator new.
	events := eventGenerator generateEvents: self.
	^ events
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
			nodes := (RTEllipse new
				size: 15;
				color: (Color blue alpha: 0.4)) + (lab text: [ :e | e model associations asString ]) elementsOn: graph nodes.
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

{ #category : #accessing }
KEModel >> initCompartments [
	initCompartments ifNil: [ 
		initCompartments := Dictionary newFrom: (self compartmentNames collect: [:c| c->0]) ].
	^ initCompartments 
	
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

{ #category : #accessing }
KEModel >> integrate: aConcern [
	concerns add: aConcern.
	self transitions: (aConcern generateTensorSum: self transitions).
	aConcern attributes keysAndValuesDo: [ :k :v| 
		self addAttribute: k value: v
	].
	aConcern parameters keysAndValuesDo: [ :k :v| 
		self addParameter: k value: v
	].
	self population reset.
	initCompartments := nil.
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
KEModel >> resetCompartments [
	population compartments: initCompartments
]

{ #category : #'*Kendrick-InternalDSL-DSL' }
KEModel >> resetTime [
	t := 0
]

{ #category : #'as yet unclassified' }
KEModel >> sizeOfPopulation [
	^ population size
]

{ #category : #accessing }
KEModel >> sizeOfPopulation: anArrayOfValues [
	"anArrayOfValues describe a subpopulation like {#S. #human. #female}. Returns the nb of individus that verify this property"

	| array |
	array := OrderedCollection new.
	anArrayOfValues isArray
		ifTrue: [ array addAll: anArrayOfValues ]
		ifFalse: [ array add: anArrayOfValues ].
	^ self population sizeOfPopulation: array
]

{ #category : #accessing }
KEModel >> t [
	^ t
]

{ #category : #accessing }
KEModel >> t: aNumber [
	t := aNumber
]
