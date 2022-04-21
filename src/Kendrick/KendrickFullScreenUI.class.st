Class {
	#name : #KendrickFullScreenUI,
	#superclass : #KendrickUI,
	#instVars : [
		'window'
	],
	#category : #'Kendrick-DSL-Internal'
}

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
