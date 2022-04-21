Class {
	#name : #ExamplesDSL,
	#superclass : #TestCase,
	#category : #'Kendrick-TestsExamples'
}

{ #category : #'as yet unclassified' }
ExamplesDSL >> testAtAttributeOfSIRExample [
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
