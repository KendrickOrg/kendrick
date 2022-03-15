Class {
	#name : #Simulation,
	#superclass : #KendrickInternalDSLEntities,
	#instVars : [
		'algo',
		'from',
		'to',
		'step',
		'simulator',
		'combo',
		'scenario',
		'scenarios'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #protected }
Simulation >> compo [

	^ combo
]

{ #category : #protected }
Simulation >> execute [

	simulator executeOn: combo model keModel.
]

{ #category : #protected }
Simulation >> exportTimeSeriesOutputsAt: anIdentifier [
	|t outDir filePath|
		
	"self class autoExport ifFalse: [ ^ self ]."
	outDir := './Sources/', KendrickInternalDSLEntities currentProjectDir , '/Output/'. 
	filePath := (outDir , self id , '.txt').
	t :=  simulator timeSeriesOutputsAt: anIdentifier.
	filePath asFileReference writeStreamDo:[ :stream | |c| 
		c := t first data.
		c do: [:elt|
			(elt isNaN) ifTrue: [ stream nextPutAll: 0 asString; nextPut: Character lf ]
		ifFalse: [stream nextPutAll: elt asString;  nextPut: Character lf ]]
	]
]

{ #category : #'public-api' }
Simulation >> for: aComboID [

	combo := Composition withId: aComboID.
]

{ #category : #'public-api' }
Simulation >> forModel: aModelID [

	combo := Composition doesNotUnderstand: aModelID
]

{ #category : #'public-api' }
Simulation >> from: aNumber [

	from := aNumber
]

{ #category : #'public-api' }
Simulation >> gillespie [

	^ self  
		with: #Gillespie
]

{ #category : #protected }
Simulation >> initialize [

super initialize.
	simulator := KESimulator
		             new: algo
		             from: from
		             to: to
		             step: step
]

{ #category : #protected }
Simulation >> model [

	^ combo model
]

{ #category : #'public-api' }
Simulation >> rungeKutta [

	^ self  
		with: #RungeKutta
]

{ #category : #'public-api' }
Simulation >> scenario: aScenarioID [
	
	scenario := Scenario withId: aScenarioID. 
	combo := scenario composition.
]

{ #category : #'public-api' }
Simulation >> scenarios: scenarioIDs [

	scenarios := scenarioIDs collect: [ :sId | Scenario withId: sId ].
	combo := scenarios last composition
]

{ #category : #'public-api' }
Simulation >> step: aNumber [

	step := aNumber
]

{ #category : #protected }
Simulation >> tauleap [

	^ self  
		with: #TauLeap 
]

{ #category : #protected }
Simulation >> timeSeriesOutputs [

	^ simulator timeSeriesOutputs 
]

{ #category : #protected }
Simulation >> timeSeriesOutputsAt: anIdentifier [

	^ simulator timeSeriesOutputsAt: anIdentifier 
]

{ #category : #'public-api' }
Simulation >> to: aNumber [

	to := aNumber
]

{ #category : #'public-api' }
Simulation >> with: anAlgorithm [

	algo := anAlgorithm 
]
