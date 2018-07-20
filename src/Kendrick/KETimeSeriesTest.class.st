Class {
	#name : #KETimeSeriesTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KETimeSeriesTest >> testATimeSeriesAtWithIndexAreNotNumber [
	| s1 |
	s1 := KETimeSeries from: #(1 2 3 4 5) withIndex:#($a $b $c $d $f).
	self assert: (s1 at: $a) equals: 1.
	self assert: (s1 at: $b) equals: 2.
	self assert: (s1 at: $c) equals: 3.
	self assert: (s1 at: $d) equals: 4.
]

{ #category : #tests }
KETimeSeriesTest >> testATimeSeriesHasSize5WhenCreatedWithAnArrayOfSize5 [
	| s1 s2|
	s1 := KETimeSeries from: #(1 2 3 4 5).
	self assert: s1 size equals: 5.
	s2 := KETimeSeries from: #(1 2 3 4 5) withIndex:#($a $b $c $d $e).
	self assert: s2 size equals: 5
]

{ #category : #tests }
KETimeSeriesTest >> testAt [
	| s1 s2 |
	s1 := KETimeSeries from: #(2 2 2 2 2).
	self assert: (s1 at: 3) equals: 2.
	s2 := KETimeSeries from: #(2 2 2 5 2) withIndex:#(2 4 6 8).
	self assert: (s2 at: 4) equals: 2
]

{ #category : #tests }
KETimeSeriesTest >> testIndexMax [
	| s1 s2 s3|
	s1 := KETimeSeries from: #(4 2 6 8 10).
	self assert: (s1 indexMax) equals: 5.
	s2 := KETimeSeries from: #(4 2 6 8 10) withIndex:#(0.1 0.2 0.3 0.4 0.5).
	self assert: (s2 indexMax) equals: 0.5.
	s3 := KETimeSeries from: #(2 5 1 8 2).
	self assert: (s3 indexMax) equals: 4
]

{ #category : #tests }
KETimeSeriesTest >> testIndexMin [
	| s1 s2 |
	s1 := KETimeSeries from: #(4 2 6 8 10).
	self assert: (s1 indexMin) equals: 2.
	s2 := KETimeSeries from: #(4 2 6 8 10) withIndex:#(0.1 0.2 0.3 0.4 0.5).
	self assert: (s2 indexMin) equals: 0.2
]

{ #category : #tests }
KETimeSeriesTest >> testIndexOfTime [
	| s2 |
	s2 := KETimeSeries from: #(2 2 2 5 2) withIndex:#(2 4 6 8).
	self assert: (s2 indexOfTime: 4) equals: 2.
	self assert: (s2 indexOfTime: 5) equals: 3.
]
