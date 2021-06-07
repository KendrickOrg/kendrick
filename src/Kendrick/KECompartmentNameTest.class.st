Class {
	#name : #KECompartmentNameTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KECompartmentNameTest >> testCompartmentNames [

	| c1 c2 c3 aModel |
	aModel := KEModel new.
	aModel attributes: { 
			(#status -> #( #S #I #R )).
			(#species -> #( human bird )) }.

	c1 := KECompartmentName new simpleName: { #S } withModel: aModel.
	self assert: c1 fullName equals: { (#status -> #S) }.

	c2 := KECompartmentName new
		      simpleName: { #S. #human }
		      withModel: aModel.
	self assert: c2 fullName equals: { 
			(#status -> #S).
			(#species -> #human) }.

	c3 := KECompartmentName new
		      simpleName: { #human. #S }
		      withModel: aModel.
	self assert: c3 fullName equals: { 
			(#status -> #S).
			(#species -> #human) }
]

{ #category : #tests }
KECompartmentNameTest >> testEqualityOfCompartmentNames [

	| aModel c1 c2 d |
	aModel := KEModel new.
	aModel attributes: { 
			(#status -> #( #S #I #R )).
			(#species -> #( human bird )) }.

	c1 := KECompartmentName new simpleName: { #S } withModel: aModel.
	c2 := KECompartmentName new simpleName: { #S } withModel: aModel.

	self assert: c1 equals: c2.
	self assert: c2 equals: c1.

	c1 := KECompartmentName new
		      simpleName: { #S. #human }
		      withModel: aModel.
	c2 := KECompartmentName new
		      simpleName: { #human. #S }
		      withModel: aModel.

	self assert: c1 equals: c2
]

{ #category : #tests }
KECompartmentNameTest >> testInitializePopulationCardinality [

	| model |
	model := KEModel new.
	model attributes: { 
			(#status -> #( S I R )).
			(#region -> #( A B C D )) }.
	model populationCardinality: 100.

	self assert: (model populationCardinality ) equals: 100
]

{ #category : #tests }
KECompartmentNameTest >> testSameAttributesShouldRaiseError [

	| aModel |
	aModel := KEModel new.
	self
		should: [ 
			aModel attributes: { 
					(#status -> #( #S #I #R )).
					(#status -> #( human bird )) } ]
		raise: Error
]

{ #category : #tests }
KECompartmentNameTest >> testSameValuesShouldRaiseError [

	| aModel |
	aModel := KEModel new.

	self
		should: [ 
			aModel attributes: { 
					(#status -> #( S I R )).
					(#species -> #( S A B )) } ]
		raise: Error.
	self
		should: [ 
			aModel attributes: { 
					(#status -> #( S I R )).
					(#species -> #( human human )) } ]
		raise: Error
]

{ #category : #tests }
KECompartmentNameTest >> testUnExistingValues [

	| aModel |
	aModel := KEModel new.
	aModel attributes: { 
			(#status -> #( #S #I #R )).
			(#species -> #( human bird )) }.

	self
		should: [ 
		KECompartmentName new simpleName: { #U } withModel: aModel ]
		raise: Error
]
