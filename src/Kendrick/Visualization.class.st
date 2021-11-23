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
	^ canvas
		ifNil: [ simulation execute.
			explicitDataSet
				ifFalse: [ simulation timeSeriesOutputs columnNames
						do: [ :each | diag addDataFrame: (simulation timeSeriesOutputsAt: each) ] ]
				ifTrue: [ lazyDataBlock value ].
			xLabel ifNotNil: [ diag xLabel: xLabel ].
			KendrickInternalDSLEntities cleanUpForInteractiveSessions.
			canvas := diag plot ]
]

{ #category : #'as yet unclassified' }
Visualization >> chart [

	^ self 
		with: KEChart 
]

{ #category : #protected }
Visualization >> cleanUpForInteractiveSessions [

	KendrickInternalDSLEntities clearAllInstances
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
		
		anArray do: [:attributeKeyOrValue | 
			|attKeys attValues compartmentName|
			tokens := attributeKeyOrValue findTokens: '_'.
			attKeys := tokens select: [ :t| simulation model attributes keys includes: t ].
			attValues := tokens reject: [ :t| simulation model attributes keys includes: t ].
			compartmentName := OrderedCollection new.
			attValues do: [ :v| compartmentName addAll: (simulation model literalTransitionRefFor: v) ].
			attKeys isEmpty 
				ifTrue: [ tSeries add: (self sumOverTimeSeries: compartmentName) ]
				ifFalse: [ 
					attKeys do: [ :k| 
						(simulation model allLiteralTransitionRefsForAttribute: k) do: [ :comp| 
							|compositeComp|
							compositeComp := compartmentName copy.
							compositeComp add: comp.
							tSeries add: (self sumOverTimeSeries: compositeComp) ] ] ] ].

	^ diag data: tSeries.
					
			
]

{ #category : #'public-api' }
Visualization >> dataWithOp: anArray [ "should be full math-expression"
	^ lazyDataBlock := [
			diag addDataFrame:  
				((simulation 
					timeSeriesOutputsAt: 
						(simulation model literalTransitionRefFor: anArray first))
					perform: anArray last)
			]
]

{ #category : #'public-api' }
Visualization >> dataWithSimpleCompartments: anArray [ "should be full math-expression"
	
		|tSeries|
		
		tSeries := OrderedCollection new.
		
		anArray do: [ :comp| 
			tSeries addAll: (simulation timeSeriesOutputsAt: (simulation model literalTransitionRefFor: comp)) ].
		^ diag data: tSeries
			

					
			
]

{ #category : #'public-api' }
Visualization >> diagram [
	^ self with: KEChart
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
	| outDir filePath c|
	
	c := RSCanvas new.
	c @ RSCanvasController.
	
	outDir := './Sources/'
		, KendrickInternalDSLEntities currentProjectDir , '/Output/'.
	outDir asFileReference exists
		ifFalse: [ outDir := './Sources/Projects/'
				, KendrickInternalDSLEntities currentProjectDir , '/Output/' ].
	filePath := outDir , self id , '.png'.

	"[outDir asFileReference createDirectory] on: Error do: [  ]."
	filePath asFileReference exists
		ifTrue: [ filePath asFileReference delete ].

"Export to PNG is desactivated right now, need to be replaced by call to RSPNGExporter class in Roassal 3"
"https://github.com/ObjectProfile/Roassal3Exporters"
RSPNGExporter new
		"whole;
		defaultScale;
		oversizedBy: 20 @ 20;
		format: #png;
		fileName: filePath; 
		ifNil: [ ^ nil ];
		export."
		
		canvas: c;
		exportToFile: filePath asFileReference.
	^ self open
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

	"diag legends: anArray asOrderedCollection "
]

{ #category : #'as yet unclassified' }
Visualization >> map [

	^ self 
		with: KEMapBuilder
]

{ #category : #'operators-mapping' }
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
		collect: [:compartment | (simulation timeSeriesOutputsAt: compartment)]. 
	
	(#(sum sqrt size log peakOfEpidemic) includes: anArray last) ifTrue: [  
			tSeries := tSeries collect: [ :ts | 
				anArray last = #peakOfEpidemic ifTrue: [( ts perform: #max ) values first] 
				ifFalse: [(ts perform: anArray last) values first ]].
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
	|d df ds|
    df := (simulation timeSeriesOutputsAt: ((STON fromString: name) associations)) collect: [ :e| e value ].
"Sum elements on each rows of the dataFrame df"

ds := df columnNames inject:0 into: [ :sum :each | sum + (df column: each) ].

"Create a new DataFrame with the previous sum with name"

ds name: (STON fromString: name).
^ds asDataFrame
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
