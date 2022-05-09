Class {
	#name : #K2AttributeExample,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-MM2'
}

{ #category : #tests }
K2AttributeExample >> testSameAttributesShouldRaiseErrorExample [

	<gtExample>
	| aAttribute |
	aAttribute := K2SAN new.
	self
		should: [ 
			aAttribute attributes: { 
					(#aState -> #( #S #I #R )).
					(#aState -> #( human bird )) } ]
		raise: Error.
		
	^aAttribute 
]
