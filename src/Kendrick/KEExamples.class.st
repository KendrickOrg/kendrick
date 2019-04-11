"
A KEExamples is a class that contains some examples of epidemiological modelling

"
Class {
	#name : #KEExamples,
	#superclass : #RTAbstractExample,
	#classInstVars : [
		'ModelExample'
	],
	#category : 'Kendrick-Examples'
}

{ #category : #'as yet unclassified' }
KEExamples class >> models [
   |models deterministic methods|   
	models := OrderedCollection new.
	deterministic := KEDeterministicExamples new.
	methods := (KEDeterministicExamples selectors 
			select: [ :symbol | (symbol beginsWith: 'model') ]).
	methods do:[ :m | models add:(deterministic perform: m) ].
	
	^ models
]

{ #category : #'as yet unclassified' }
KEExamples >> gtOpenOn: v [
	|  icon64Mime form element  |
	self gtExamples do: [ :anExample |
		[icon64Mime := self perform: (anExample, #Icon) asSymbol.] 
		on: Error do: 
		[ icon64Mime := self defaultIcon].
		"form := TRPlatform current formClass fromBinaryStream: 
							(TRPlatform current mimeDecodeToBytes: icon64Mime readStream)."
		form := Form fromBinaryStream: 
							(Base64MimeConverter mimeDecodeToBytes: icon64Mime readStream).
		element := (RTBitmap new form: form) elementOn: anExample.
		element @ (RTPopup new text: anExample selector asString).
		element @ (RTEventForwarder new eventClass: TRMouseDragging). 
		v add: element ].

	RTGridLayout new on: v elements.
	
]

{ #category : #'as yet unclassified' }
KEExamples >> openOn: v [

	| exampleSymbols icon64Mime form element  helpBar |

	exampleSymbols := self class selectors 
								select: [ :symbol | (symbol beginsWith: 'example') 
															and: [ (symbol endsWith: 'Icon') not ] ].
	exampleSymbols do: [ :k |
		[icon64Mime := self perform: (k, #Icon) asSymbol.] 
		on: Error do: 
		[ icon64Mime := self defaultIcon ].
		"form := TRPlatform current formClass fromBinaryStream: 
							(TRPlatform current mimeDecodeToBytes: icon64Mime readStream)."
		form := Form fromBinaryStream: 
							(Base64MimeConverter mimeDecodeToBytes: icon64Mime readStream).
		element := (RTBitmap new form: form) element.
		element @ (RTPopup new text: k asString).
		element when: TRMouseLeftClick do: [ :evt | self class new perform: k ].
		element when: TRMouseRightClick do: [ :evt | (self class >> k) browse ].
		element @ (RTEventForwarder new eventClass: TRMouseDragging). 
		v add: element.
	].

	RTGridLayout new on: v elements.
	
	v canvas addMenu: 'back' callback: [ self pressedBackButtonOn: v ].
	helpBar := TRLabelShape new text: ' Left to run / Right for code'.
	v canvas addFixedShape: helpBar.
	TRConstraint stickAtTheBottomOfTheWindow: helpBar.
	
]
