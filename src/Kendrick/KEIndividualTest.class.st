Class {
	#name : #KEIndividualTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core-IBM'
}

{ #category : #tests }
KEIndividualTest >> testUpdateAttributes [
	|ind|
	ind := KEIndividual new currentStatus: (Dictionary newFrom:{#status->#S. #region->#A}).
	ind nextStatus: (Dictionary newFrom: {#status->#I. #region->#A}).
	ind updateAttributes: ind nextStatus.
	
	self assert: (ind attributes at: #status) equals: #I.
	self assert: (ind attributes at: #region) equals: #A
]
