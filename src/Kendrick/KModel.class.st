"
KendrickModel is part of Kendrick DSL to express epi models.

```
KendrickModel nameOfModel
```
"
Class {
	#name : #KModel,
	#superclass : #KendrickComposite,
	#instVars : [
		'delays',
		'structuralDependencies',
		'extending',
		'map',
		'borders'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'public-api' }
KModel >> addStatus: symExpression [

	(attributes at: #status) add: symExpression first.
	backEndEntity addStatus: symExpression.
]

{ #category : #'public-api' }
KModel >> addTransition: symExpression [

	|newTransition| 

	newTransition :=
		KendrickTransitions new with: symExpression.
	   newTransition convertToCompatibleBackendRepresentation do: [:assoc |
		|from to propability|
		from := assoc key key asString asSymbol.
		propability := assoc key value.
		to := assoc value asString asSymbol.
		self allTransitionsFor: { from . propability . to } ].
]

{ #category : #'public-api' }
KModel >> allHierarchyTransitions [

	^ backEndEntity transitions copy 
		addAll: (structuralDependencies 
			flatCollect: [ :name | (KModel withId: name) allTransitions ]);
		yourself
]

{ #category : #'public-api' }
KModel >> allTransitions [

	^ ((Composition Temp concern: self id) instVarNamed: #backEndEntity) transitions copy 
		
]

{ #category : #'public-api' }
KModel >> connectionMatrix: aMatrix [
	borders := aMatrix

]

{ #category : #'public-api' }
KModel >> connectionTopology: aTopologyPattern [
	

]

{ #category : #'public-api' }
KModel >> delay: symExpression [
 
	"#(sigma , S -- lambda --> I  , E)"
	| varList delay targetLeftNode initialRate targetRightNode newNode |
	varList := symExpression 
		select: [ :token | (#(-- --> ,) includes: token) not ].
	delays add: varList.
	delay := varList first.
	targetLeftNode := self literalTransitionRefFor: varList second.
	initialRate := varList third.
	targetRightNode :=  self literalTransitionRefFor: varList fourth.
	newNode := { targetRightNode first key -> varList fifth }.
	
	backEndEntity atAttribute: targetRightNode first key add: varList fifth.
	(attributes at: targetRightNode first key) add: varList fifth.
	
	backEndEntity 
		removeTransitionFrom: targetLeftNode  
		to: targetRightNode.
	backEndEntity 
		addTransitionFrom: targetLeftNode  
		to: newNode  
    	probability: [ :aModel| aModel atParameter: initialRate ].
	backEndEntity 
    addTransitionFrom: newNode  
    to: targetRightNode  
    probability: [ :aModel| aModel atParameter: delay ].
	backEndEntity 
    addTransitionFrom: newNode 
    to: #empty 
    probability: [ :aModel| aModel atParameter: (emptyRate ifNil: [#mu]) "default value" ].
]

{ #category : #'public-api' }
KModel >> doesNotUnderstand: aMessage [

	|variable value|
	
	variable := aMessage selector.
	variable := (variable asString trimRight: [: c | c =  $:]) asSymbol.
	value := aMessage arguments first.
 
	(self attributeValuesIncludes: variable)
		ifTrue: [ 
			explicitelySetCompartments add: {variable->value}.
		] ifFalse: [  
		(self parameters keys includes: variable)
			ifTrue: [  
				parameters at: variable put: value.
			] ifFalse: [ 
					KendrickDSLSyntaxError 
								signal: 'Undefined Variable Being Set: ' , variable asString ]. 
		].
	
	
]

{ #category : #'public-api' }
KModel >> extends [

	^ structuralDependencies

]

{ #category : #'public-api' }
KModel >> extends: anotherConcernName [

	super extends: anotherConcernName.
	structuralDependencies := {  anotherConcernName }.
	transitions := OrderedCollection new.
	extending := backEndEntity.
	backEndEntity := KEModelPart dependOn: backEndEntity.
]

{ #category : #'as yet unclassified' }
KModel >> gtInspectorKendrickGraphIn: composite [

	<gtInspectorPresentationOrder: -20>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>

	^ ((Composition Temp concern: self id) instVarNamed: #backEndEntity) gtInspectorKendrickGraphIn: composite
]

{ #category : #'public-api' }
KModel >> initialize [

	super initialize.

	backEndEntity := KEModelPart new.
	structuralDependencies := OrderedCollection new.
	delays := OrderedCollection new.

]

{ #category : #protected }
KModel >> keConcern [

	^ backEndEntity.

]

{ #category : #'public-api' }
KModel >> maps: aMapEntity [

	"should not be used because of ad hoc, will be replaced by connectionMatrix"

	map := Map withId: aMapEntity.
	self attribute: map attributeToRegions.
	borders := map borders
]

{ #category : #'public-api' }
KModel >> splitStatus: symExpression [

	"splitStatus: {  #(I). index->#(1 2) }.
	splitStatus: #(I index #(1 2))"

	|statusCompartment indexes|
	
	statusCompartment := symExpression copyFrom: 1 to: ((symExpression indexOf: #index)-1).
	indexes := symExpression last.

	indexes do: [:index | 
		statusCompartment do: [ :e| 
			(attributes at: #status) 
				add: (e asString , index asString) asSymbol].
	].
	backEndEntity transitions: self allHierarchyTransitions. 
	backEndEntity splitStatus: { statusCompartment . symExpression second -> indexes }.
]

{ #category : #'public-api' }
KModel >> transitionRate: aSymbol [
	"will replace the withTransitionRate as discussing about the surgar syntax with Mikal"
	parameters at: aSymbol put: 0.
	self imports: borders using: aSymbol
]
