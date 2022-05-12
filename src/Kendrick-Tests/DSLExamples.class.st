Class {
	#name : #DSLExamples,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-DSL-Examples'
}

{ #category : #tests }
DSLExamples >> testAtAttributeOfMetapopulationExample [

	<gtExample>
	| patchExample |
	patchExample := KModel new.
	patchExample
		attribute: #( patch -> 1 2 3 );
		parameters: #( rho );
		transitions:
			#( 1 -- rho --> 2 #'.' 2 -- rho --> 3 #'.' 3 -- rho --> 1 #'.' ).
	self assert: (patchExample backEndModel atAttribute: #patch) size equals: 3.

	^ patchExample backEndModel
]

{ #category : #tests }
DSLExamples >> testAtAttributeOfSIRExample [

	<gtExample>
	| sirExample |
	sirExample := KModel new.
	sirExample
		attribute: #( status -> S I R );
		parameters: #( beta lambda gamma mu );
		transitions: #( S -- lambda --> I #'.' I -- gamma --> R #'.' );
		lambda: #( beta * I / N ).
	self assert: (sirExample backEndModel atAttribute: #status) size equals: 3.
	^ sirExample backEndModel
]

{ #category : #tests }
DSLExamples >> testVerifyAllStatesOfSIRExample [ 
	<gtExample>
	|sirExample allStatesOfModel|
	sirExample := KModel new.
	sirExample 
		attribute: #(status -> S I R);
		parameters: #(beta lambda gamma mu);
		transitions: #(
			S -- lambda --> I.
			I -- gamma --> R.);
		lambda: #(beta*I/N).
		
	allStatesOfModel := #(#S #I #R) asOrderedCollection.
	self assert: (sirExample atAttribute: #status) equals: allStatesOfModel.
	^sirExample 
]

{ #category : #tests }
DSLExamples >> testVerifyAllTransitionsOfSIRExample [
	<gtExample>
	|sirExample transtionsOfModel|
	sirExample := KModel new.
	sirExample 
		attribute: #(status -> S I R);
		parameters: #(beta lambda gamma mu);
		transitions: #(
			S -- lambda --> I.
			I -- gamma --> R.);
		lambda: #(beta*I/N).
		
		
	transtionsOfModel := OrderedCollection new.
	transtionsOfModel 
			add: #S->#lambda->#I;
		 	add: #I->#gamma->#R.
		 
	self assert: sirExample transitions equals: transtionsOfModel .
	^sirExample
]

{ #category : #tests }
DSLExamples >> testVerifyNumberOfTransitionsOfSIRExampleIs2 [ 
	<gtExample>
	|sirExample|
	sirExample := KModel new.
	sirExample 
		attribute: #(status -> S I R);
		parameters: #(beta lambda gamma mu);
		transitions: #(
			S -- lambda --> I.
			I -- gamma --> R.);
		lambda: #(beta*I/N).

	self assert: (sirExample allTransitions size) equals: 2.
	^sirExample 
]
