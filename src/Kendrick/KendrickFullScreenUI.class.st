Class {
	#name : #KendrickFullScreenUI,
	#superclass : #KendrickUI,
	#instVars : [
		'window'
	],
	#category : 'Kendrick-InternalDSL'
}

{ #category : #openning }
KendrickFullScreenUI class >> inspect: anObject label: aString [

	| instance |
	instance := self new.
	instance 
		title: aString;
		openOn: anObject.
	self splashLogo.
	^ instance
]

{ #category : #'instance creation' }
KendrickFullScreenUI >> openOn: aPage [
	| w |
	w := self 
		openOn: aPage 
		with: self defaultRenderer.
	"w extent: self class preferredExtent."
	^ w
]

{ #category : #'instance creation' }
KendrickFullScreenUI >> openWith: aRenderer [ 
	 
	window := GLMMorphicWindowRenderer render: self from: aRenderer.
	^ window openFullscreen.
]
