Class {
	#name : #KendrickCMDHandler,
	#superclass : #CommandLineHandler,
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
KendrickCMDHandler class >> commandName [

	^ 'kendrick'
]

{ #category : #'as yet unclassified' }
KendrickCMDHandler class >> description [
^ 'Kendrick Epidemiology Modelling and simulation use --input for your script and --output for the results in .png and .cvs'
]

{ #category : #'as yet unclassified' }
KendrickCMDHandler class >> entityFilesDir [

	^ Smalltalk vmDirectory parent asFileReference 
]

{ #category : #'as yet unclassified' }
KendrickCMDHandler class >> isResponsibleFor: commandLineArguments [

	"commandLineArguments withFirstArgument: [ :arg|
		(#('--epiRun') includes: arg)
		ifTrue: [ ^ true ]]."
	
	^ commandLineArguments includesSubCommand: self commandName
]

{ #category : #'as yet unclassified' }
KendrickCMDHandler >> activate [
	|inDisk|
	
	self activateHelp.
	self arguments ifEmpty: [ ^ self error: '[KENDRICK] No input file defined' ].
	inDisk := "self class entityFilesDir / "self arguments first asFileReference.
	KendrickInternalDSLEntities currentProjectDir: inDisk projectNameForKendrick.
			inDisk exists 	
				ifTrue: [ 
					|rs entity|
					rs :=  inDisk readStream. 
					entity := Compiler evaluate: rs upToEnd.
					rs close.  
					entity
				] ifFalse: [ ^ self error: '[KENDRICK] No such file or directory: ' , inDisk asString ].
	self quit.
			
]
