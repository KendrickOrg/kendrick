Class {
	#name : #KendrickUI,
	#superclass : #GTInspector,
	#category : 'Kendrick-InternalDSL'
}

{ #category : #openning }
KendrickUI class >> inspect: anObject label: aString [
	| instance |
	instance := self new.
	(instance
		title: aString;
		openOn: anObject) fullscreen.
	self splashLogo.
	^ instance
]

{ #category : #'world menu' }
KendrickUI class >> menuCommandOn: aBuilder [
 <worldMenu>

	(aBuilder item: #'Kendrick Browser')
			order: 0.1; 
			parent: #Kendrick;
			label: 'Kendrick UI';
			icon: KEIcon smallKendrick;
			action: [ self openWithDependancies ]	

]

{ #category : #'as yet unclassified' }
KendrickUI class >> numberOfInspectorPanes [

	^ 4
]

{ #category : #'instance creation' }
KendrickUI class >> open [

	^ self 
		inspect: (SmalltalkImage current lastImagePath asFileReference parent / 'Sources/')
		label: 'KendrickUI'
]

{ #category : #'as yet unclassified' }
KendrickUI class >> openWithDependancies [

((SmalltalkImage current lastImagePath) asFileReference parent / 'Sources') exists ifFalse:[

	ZnClient new url: 'https://gitlab.com/ird-ummisco-npapoylias/kendrick-extentions/raw/master/example.zip'; downloadTo: 'example.zip'.

UIManager default informUserDuring: 
		[ :bar | 
	(ZipArchive new
			readFrom: 'example.zip' asFileReference)
			extractAllTo: (SmalltalkImage current lastImagePath) asFileReference parent
			informing: bar 
			overwrite: true].

'example.zip' asFileReference delete.
].
	^ self open
]

{ #category : #openning }
KendrickUI class >> splashLogo [
	| logoMorph logoPath |
	logoPath := SmalltalkImage current lastImagePath asFileReference
		parent / '.res/kendrickLogo.png'.
	logoMorph := (ImageReadWriter formFromStream: logoPath readStream)
		asMorph.
	logoMorph openCenteredInWorld.
	[ (Delay forSeconds: 3) wait.
	logoMorph delete ] fork
	"show logo for 3 seconds, while loading the UI in parallel"
]

{ #category : #'as yet unclassified' }
KendrickUI >> initialize [

	super initialize.
	
	self presentationFilter: (GTInspectorTagFilter new
			defaultTag: nil;
			addAndSelectTag: #kendrick).

]

{ #category : #'as yet unclassified' }
KendrickUI >> printObjectAsAnItem: anObject [

	[^ anObject kendrickDescription] on: MessageNotUnderstood do: [ ^  anObject class name asString]
]
