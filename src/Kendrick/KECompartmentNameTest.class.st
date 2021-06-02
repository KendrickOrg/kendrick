Class {
	#name : #KECompartmentNameTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KECompartmentNameTest >> testCompartmentNames [

	| c1 c2 aModel c3 c4 |
	aModel := KEModel new.
	aModel attributes: { 
			(#status -> #( #S #I #R )).
			(#species -> #( human bird )) }.

	c1 := KECompartmentName new fullName: { (#status -> #S) }.
	self assert: c1 fullName equals: { (#status -> #S) }.

	c2 := KECompartmentName new fullName: { 
			      (#status -> #S).
			      (#species -> #human) }.
	self assert: c2 fullName equals: { 
			(#status -> #S).
			(#species -> #human) }.

	c3 := KECompartmentName new simpleName: { #S } withModel: aModel.
	self assert: c3 fullName equals: { (#status -> #S) }.

	c4 := KECompartmentName new
		      simpleName: { #S. #human }
		      withModel: aModel.
	self assert: c4 fullName equals: { 
			(#status -> #S).
			(#species -> #human) }
]
