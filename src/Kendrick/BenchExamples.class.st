Class {
	#name : #BenchExamples,
	#superclass : #Object,
	#category : 'Kendrick-InternalDSL'
}

{ #category : #'as yet unclassified' }
BenchExamples class >> run [

	Transcript show: 'Measles'; cr.
	TestMeaslesScripts new bench.
	Transcript show: 'Infuenza 1SP'; cr.
	TestDependantConcern new bench.
	Transcript show: 'Infuenza 2SP'; cr.
	TestMultiSpeciesSpatialDependant new bench.
]
