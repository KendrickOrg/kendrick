"
Visualization is one of the Kendrick DSL element that allows to visualize results of simulation.

"
Class {
	#name : #Visualization,
	#superclass : #KendrickInternalDSLEntities,
	#instVars : [
		'simulation',
		'xLabel',
		'yLabel',
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
			  ifFalse: [ 
				  simulation timeSeriesOutputs columnNames do: [ :eachName | 
					diag addDataFrame: (simulation timeSeriesOutputsAt: eachName) ] ]
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

{ #category : #protected }
Visualization >> dataWithCompartments: compartmentNames [

	"should be full math-expression"

	"We consider two possibilities: composite and simple compartments"

	^ lazyDataBlock := [ 
	                   (compartmentNames first asString includes: $_)
		                   ifTrue: [ 
		                   self dataWithCompositeCompartments:
			                   compartmentNames ]
		                   ifFalse: [ 
		                   self dataWithSimpleCompartments:
			                   compartmentNames ] ]
]

{ #category : #protected }
Visualization >> dataWithCompositeCompartments: anArray [

	"should be full math-expression"

	"Return a KEChart filled with series as data"

	| tokens tSeries |
	tSeries := OrderedCollection new.
	anArray do: [ :compName | 
		| attKeys attValues compartmentName |
		tokens := compName findTokens: '_'.
		attKeys := tokens select: [ :t | 
			           simulation model attributes keys includes: t ].
		attValues := tokens reject: [ :t | 
			             simulation model attributes keys includes: t ].
		compartmentName := OrderedCollection new.
		attValues do: [ :v | 
			compartmentName addAll:
				(simulation model literalTransitionRefFor: v) ].
		attKeys isEmpty
			ifTrue: [ 
			tSeries add: (simulation timeSeriesOutputsAt: compartmentName)]
			ifFalse: [ 
				attKeys do: [ :k | 
					(simulation model allLiteralTransitionRefsForAttribute: k) do: [ 
						:comp | 
						| compositeComp |
						compositeComp := compartmentName copy.
						compositeComp add: comp.
						tSeries add: (self sumOverTimeSeries: compositeComp) ] ] ] ].
	tSeries do: [ :df | diag addDataFrame: df ].
	^ diag
]

{ #category : #protected }
Visualization >> dataWithOp: anArray [ "should be full math-expression"
	^ lazyDataBlock := [
			diag addDataFrame:  
				((simulation 
					timeSeriesOutputsAt: 
						(simulation model literalTransitionRefFor: anArray first))
					perform: anArray last)
			]
]

{ #category : #protected }
Visualization >> dataWithSimpleCompartments: compartmentNames [

	"compartmentsNames is a collection of names of simple compartments like I or S"

	"Returns the chart where these compartments values are plotted"

	| tSeries |
	tSeries := compartmentNames collect: [ :comp | 
		           simulation timeSeriesOutputsAt:
			           (simulation model literalTransitionRefFor: comp) ].
	tSeries do: [ :df | diag addDataFrame: df ].
	^ diag
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

	| outDir filePath c |
	c := RSCanvas new.
	c @ RSCanvasController.

	outDir := './Sources/'
	          , KendrickInternalDSLEntities currentProjectDir
	          , '/Output/'.
	outDir asFileReference exists ifFalse: [ 
		outDir := './Sources/Projects/'
		          , KendrickInternalDSLEntities currentProjectDir
		          , '/Output/' ].
	filePath := outDir , self id , '.png'.

	"[outDir asFileReference createDirectory] on: Error do: [  ]."
	filePath asFileReference exists ifTrue: [ 
		filePath asFileReference delete ].

	RSPNGExporter new
		canvas: c;
		exportToFile: filePath asFileReference.

	^ self open
]

{ #category : #'public-api' }
Visualization >> for: simulationID [

	simulation := (Simulation withId: simulationID) initialize
]

{ #category : #initialization }
Visualization >> initialize [

	"explicitDataSet is set to true when the user specify the compartments to plot"
	
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

{ #category : #'public-api' }
Visualization >> map [

	^ self 
		with: KEMapBuilder
]

{ #category : #'operators-mapping' }
Visualization >> map: anArray [

	"assume composite"

	| tSeries computedCompartments compositeCompartments attribute |
	explicitDataSet := true.

	tSeries := OrderedCollection new.
	attribute := anArray first.

	computedCompartments := (anArray second findTokens: '_') collect: [ 
		                        :token | 
		                        simulation model 
			                        allLiteralTransitionRefsForAttribute: token ].

	compositeCompartments := self
		                         expand: #(  )
		                         forLists: computedCompartments.

	self buildMapFrom: attribute given: compositeCompartments.

	tSeries := compositeCompartments collect: [ :compartment | 
		           simulation timeSeriesOutputsAt: compartment ].

	(#( sum sqrt size log peakOfEpidemic ) includes: anArray last) 
		ifTrue: [ 
			tSeries := tSeries collect: [ :ts | 
				           anArray last = #peakOfEpidemic
					           ifTrue: [ (ts perform: #max) values first ]
					           ifFalse: [ (ts perform: anArray last) values first ] ] ].

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

	^ diag data: tSeries
]

{ #category : #protected }
Visualization >> open [

	self canvas.
	^ diag
]

{ #category : #protected }
Visualization >> sumOverTimeSeries: name [

	"Answer a dataframe where we sum over name"

	"At the moment this method does not work because we return a time series instead of a dataframe"

	| df ds |

	df := (simulation timeSeriesOutputsAt: name asArray) collect: [ :e | 
		      e value ].

	"Sum elements on each rows of the dataFrame df"
	ds := df columnNames
		      inject: 0
		      into: [ :sum :each | sum + (df column: each) ].

	"Create a new DataFrame with the previous sum with name"
	ds name: name.
	^ ds "asDataFrame"
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

{ #category : #accessing }
Visualization >> yLabel: aString [

	diag yLabel: aString
]
