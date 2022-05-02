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
		attribute: #(patch -> 1  2  3);
		parameters: #(rho);
		transitions: #(
			1 -- rho --> 2.
			2 -- rho --> 3.
			3 -- rho --> 1.).
	 self assert: (patchExample atAttribute: #patch) size equals: 3.

	^patchExample


]

{ #category : #tests }
DSLExamples >> testAtAttributeOfSIRExample [ 
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
	self assert: (sirExample atAttribute: #status) size equals: 3.
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
