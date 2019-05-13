Class {
	#name : #Visualization,
	#superclass : #KendrickInternalDSLEntities,
	#instVars : [
		'simulation',
		'xLabel',
		'diag',
		'builder',
		'explicitDataSet',
		'lazyDataBlock',
		'canvas'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
Visualization >> buildMapFrom: attribute [

	|mapConcern|

	mapConcern := (simulation compo 
		concerns select: [ :concern | concern attributes keys includes: attribute ]) first.
		
	diag countries: (mapConcern attributes at: attribute).
	
	mapConcern transitions do: [ :transition | 
		diag routesFrom: transition key key toAll: { transition value }
	].
	
	
]

{ #category : #'as yet unclassified' }
Visualization >> buildMapFrom: attribute given: compositeCompartments [

	|mapConcern countries|

	mapConcern := (simulation compo 
		concerns select: [ :concern | concern attributes keys includes: attribute ]) first.	
	
	countries := (compositeCompartments collect: [ :item | 
			(item select: [ :assoc | 
				assoc key asSymbol = attribute asSymbol  ]) collect: #value ]) flatten.
		
	diag countries: (mapConcern attributes at: attribute).
	
	mapConcern transitions do: [ :transition | 
		diag routesFrom: transition key key toAll: { transition value }
	].
	
	
]

{ #category : #protected }
Visualization >> canvas [

	^ canvas ifNil: [  

		simulation execute.
		explicitDataSet 
			ifFalse: [ diag data: simulation timeSeriesOutputs ]
			ifTrue: [ lazyDataBlock value ].
		xLabel ifNotNil: [diag xLabel: xLabel].
		KendrickInternalDSLEntities cleanUpForInteractiveSessions.

		"self halt."

		canvas := diag build build view canvas]
]

{ #category : #protected }
Visualization >> cleanUpForInteractiveSessions [

	KendrickInternalDSLEntities clearAllInstances.
	MooseModel resetMeta.
]

{ #category : #'public-api' }
Visualization >> data: anArray [ "should be full math-expression"

	"refactor !!"

	explicitDataSet := true.
	
	builder = KEMapBuilder ifTrue: [ ^ lazyDataBlock := [self map: anArray] ].

	(#(sum sqrt size log peakOfEpidemic) includes: anArray last) ifTrue: [  
			self dataWithOp: anArray 
	] ifFalse: [  
			self dataWithCompartments: anArray		
	]
]

{ #category : #'public-api' }
Visualization >> dataWithCompartments: anArray [ "should be full math-expression"
		^ lazyDataBlock := [		
				(anArray first asString includes: $_)
						ifTrue: [self dataWithCompositeCompartments: anArray]
						ifFalse: [self dataWithSimpleCompartments: anArray]
			]
					
			
]

{ #category : #'public-api' }
Visualization >> dataWithCompositeCompartments: anArray [ "should be full math-expression"
		
		| tokens tSeries |
		
		tSeries := OrderedCollection new.
		
		anArray do: [:name | 
				tokens := name findTokens: '_'.
					(simulation model allLiteralTransitionRefsForAttribute: tokens second) do: [:comp |  
						|compositeCompartment|
						compositeCompartment 
							:= (simulation model literalTransitionRefFor: tokens first) allButLast.
						compositeCompartment := compositeCompartment , ' , ' , comp allButFirst.
						tSeries add: (self sumOverTimeSeries: compositeCompartment).			
					]	
				].

	^ diag data: tSeries.
					
			
]

{ #category : #'public-api' }
Visualization >> dataWithOp: anArray [ "should be full math-expression"
	^ lazyDataBlock := [
			diag data: 
				((simulation 
					timeSeriesOutputsAt: 
						(simulation model literalTransitionRefFor: anArray first))
					perform: anArray last)
			]
]

{ #category : #'public-api' }
Visualization >> dataWithSimpleCompartments: anArray [ "should be full math-expression"

		^ diag data: 
			(simulation 
					timeSeriesOutputsAt: 
						(simulation model literalTransitionRefFor: anArray first))

					
			
]

{ #category : #'as yet unclassified' }
Visualization >> diagram [

	^ self 
		with: KEDiagramBuilder
]

{ #category : #'as yet unclassified' }
Visualization >> expand: prefix forLists: lists [

  ^ lists isEmpty
        ifTrue: [ Array with: prefix ]
        ifFalse: [ | tail |
            tail := lists allButFirst: 1.
            lists first inject: #() into: [ :all :each |
                all, (self expand: (prefix copyWith: each) forLists: tail) ] ].
]

{ #category : #'public-api' }
Visualization >> exportToPng [

	|outDir filePath|

	outDir := './Sources/', KendrickInternalDSLEntities currentProjectDir , '/Output/'. 
	outDir asFileReference exists 
		ifFalse: [ outDir := './Sources/Projects/', KendrickInternalDSLEntities currentProjectDir , '/Output/'].
	filePath := (outDir , self id , '.png').

	"[outDir asFileReference createDirectory] on: Error do: [  ]."

	filePath asFileReference 
		exists ifTrue: [ filePath asFileReference delete ].	

	(RTCanvasExporter canvas: self canvas)
		whole;
		defaultScale;
		oversizedBy: 20 @ 20;
		format: #png;
		fileName: filePath; 
		ifNil: [ ^ nil ];
		export.
		
	^ self canvas
]

{ #category : #'public-api' }
Visualization >> for: simulationID [

	simulation := (Simulation withId: simulationID) init.
]

{ #category : #'public-api' }
Visualization >> initialize [

	explicitDataSet := false
]

{ #category : #'public-api' }
Visualization >> legendTitle: aString [

	diag legendTitle: aString
]

{ #category : #'public-api' }
Visualization >> legends: anArray [

	diag legends: anArray asOrderedCollection 
]

{ #category : #'as yet unclassified' }
Visualization >> map [

	^ self 
		with: KEMapBuilder
]

{ #category : #'as yet unclassified' }
Visualization >> map: anArray [

	"assume composite"
	
	| tSeries tokens computedCompartments compositeCompartments attribute |
	explicitDataSet := true.
	
	tSeries := OrderedCollection new.
	attribute := anArray first.
	
	computedCompartments := (anArray second findTokens: '_') collect: [:token | (simulation model allLiteralTransitionRefsForAttribute: token)]. 

	compositeCompartments := self expand: #() forLists: computedCompartments.

	self buildMapFrom: attribute given: compositeCompartments.	
	
	tSeries := compositeCompartments 
		collect: [:compartment | (simulation timeSeriesOutputsAt: compartment) first]. 
	
	(#(sum sqrt size log peakOfEpidemic) includes: anArray last) ifTrue: [  
			tSeries := tSeries collect: [ :ts | ts perform: anArray last ].
	].
	
"		anArray do: [:name | 
				tokens := name findTokens: '_'.
				
					(simulation model allTransitionRefsForAttribute: tokens second) do: [:comp |  
						|compositeCompartment|
						compositeCompartment 
							:= (simulation model transitionRefFor: tokens first) allButLast.
						compositeCompartment := compositeCompartment , ' , ' , comp allButFirst.
						tSeries add: (self sumOverTimeSeries: compositeCompartment).			
					]	
				]."

	^ diag data: tSeries.
	
	
]

{ #category : #protected }
Visualization >> open [

	self canvas. "to generate / simulate"

	^ diag.
]

{ #category : #'public-api' }
Visualization >> sumOverTimeSeries: name [

	"refactor !!"
	|d tmp|
    tmp := (simulation timeSeriesOutputsAt: name) collect: [ :e| e value ].
    d := OrderedCollection new.
    1 to: tmp first data size do: [ :k| d add: (tmp collect: [:e| e data at: k]) sum ].
    ^ (KETimeSeries from: d withIndex: tmp first index) compartment: (STON fromString: name)
   
]

{ #category : #protected }
Visualization >> view [

	self canvas. "to generate / simulate"

	^ diag open.
]

{ #category : #protected }
Visualization >> with: aBuilder [

	builder := aBuilder.
	diag := builder new.
]

{ #category : #'public-api' }
Visualization >> xLabel: aString [

	xLabel := aString
]
