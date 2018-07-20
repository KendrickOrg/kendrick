Class {
	#name : #KendrickInternalDSLEntities,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#classVars : [
		'currentProjectDir'
	],
	#classInstVars : [
		'storedInstances'
	],
	#category : 'Kendrick-InternalDSL'
}

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> cleanUpForInteractiveSessions [

	"self cleanUpForInteractiveSessions"

	KendrickInternalDSLEntities clearAll.
	"MooseModel resetMeta."
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> clearAll [

	self allSubclassesDo: [ :subclass | subclass clearAllInstances ]
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> clearAllInstances [

	storedInstances := nil
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> currentProjectDir [

	^ currentProjectDir
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> currentProjectDir: aProjectDir [

	currentProjectDir := aProjectDir 
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> doesNotUnderstand: aMessage [
	

	
	[self storedInstances 
		remove: (self storedInstances detect: [:i | 
			i id asSymbol = aMessage selector  ])] 
		on: NotFound do: [  ].

	^ self new id: aMessage selector
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> entityExistsIn: path [
	
	path exists 	
				ifTrue: [ 
					|rs entity|
					rs :=  path readStream. 
					entity := Compiler evaluate: rs upToEnd.
					rs close.  
					^ entity
				]
				ifFalse: [ NotFoundError signal: 'NO such entity: ' , path asString ]	
			
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> entityFilesDir [

	^ (SmalltalkImage current lastImagePath asFileReference parent/ 'Sources/Library/')
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> entityFilesDir: aProject [

	^ (SmalltalkImage current lastImagePath asFileReference parent / ('Sources/Projects/' , aProject , '/'))
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> new [

	^ self storedInstances addFirst: self basicNew initialize
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> pathLookUpFor: anId [
	
	|inDisk|
	
	inDisk := (self entityFilesDir: self currentProjectDir) / self asString / (anId asString , '.kendrick'). "currentProject"
	[^ self entityExistsIn: inDisk] 
		on: NotFoundError
		do: [  
			inDisk := self entityFilesDir / self asString / (anId asString , '.kendrick'). "library"
			^ self entityExistsIn: inDisk.
		]
			
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> storedInstances [

	^ storedInstances ifNil: [ storedInstances := OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities class >> withId: anId [
	
	|inImage inDisk|

	inImage := (self storedInstances select: [ :instance | instance id = anId ]).
	inImage isEmpty 	
		ifFalse: [ ^ inImage first ]
		ifTrue: [  
			^ self pathLookUpFor: anId
		]
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities >> changeId: aString [

	id := aString
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities >> doesNotUnderstand: aMessage [

	KendrickDSLSyntaxError signal: self class name , ' has no keyword ' , aMessage selector.
]

{ #category : #'public-api' }
KendrickInternalDSLEntities >> extends: anotherEntityName [
	"copy down semantics -- check how shallow is the default copy on this one"
	|previousId|
	previousId := id.
	self become: (self class withId: anotherEntityName) copy.
	self changeId: previousId.
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities >> id [

	^ id
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities >> id: aString [

	id := aString
]

{ #category : #'as yet unclassified' }
KendrickInternalDSLEntities >> kendrickDescription [

	^ self class name 
]
