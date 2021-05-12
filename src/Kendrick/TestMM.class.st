Class {
	#name : #TestMM,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-MM'
}

{ #category : #tests }
TestMM >> testKEModelHasAName [

| m |
m := KEModel new modelName:'SIR'.
m assert: m modelName equals: 'SIR'
]
