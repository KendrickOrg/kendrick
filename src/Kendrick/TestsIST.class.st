Class {
	#name : #TestsIST,
	#superclass : #TestCase,
	#category : 'Kendrick-InternalDSL'
}

{ #category : #'as yet unclassified' }
TestsIST >> script [
]

{ #category : #'as yet unclassified' }
TestsIST >> setUp [

	KendrickInternalDSLEntities clearAll.
]

{ #category : #'as yet unclassified' }
TestsIST >> tearDown [

	KendrickInternalDSLEntities clearAll.
]

{ #category : #'as yet unclassified' }
TestsIST >> testScript [
	self class = TestsIST ifTrue: [ self skip ]. "abstract class with concrete test..."
	"need smth stronger here like the before/after tests on TestsMultiSpecies etc"
	self script.
	(Visualization withId: self vizId) open.
]

{ #category : #'as yet unclassified' }
TestsIST >> vizId [

	self subclassResponsibility 
]
