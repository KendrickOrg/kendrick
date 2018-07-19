"
A KETimeSeries represents the output data of simulation for each compartment. KETimeSeries shows the temporal dynamics of each compartment of the model

Instance Variables
	data:		<Array>
	index:		<Array>

data
	- the simulation output dynamics of a compartment

index
	- the time array of the KETimeSeries

"
Class {
	#name : #KETimeSeries,
	#superclass : #KEEntity,
	#instVars : [
		'data',
		'index',
		'compartment'
	],
	#category : 'Kendrick-Semantic-Model-Core'
}

{ #category : #meta }
KETimeSeries class >> annotation [
	<MSEClass: #TimeSeries super: #KEEntity >
	<package: #KE>
	^ self
]

{ #category : #accessing }
KETimeSeries class >> from: anArray [
	^ super new
		data: anArray;
		index: ((1 to: anArray size) asArray)
]

{ #category : #'as yet unclassified' }
KETimeSeries class >> from: anArray withIndex: anArrayOfTimeIndex [
	^ super new
		data: anArray;
		index: anArrayOfTimeIndex 
]

{ #category : #'as yet unclassified' }
KETimeSeries class >> from: anArray withIndex: anArrayOfTimeIndex compartment: aCompartmentName [
	^ super new
		data: anArray;
		index: anArrayOfTimeIndex;
		compartment: aCompartmentName  
]

{ #category : #adding }
KETimeSeries >> add: element atIndex: indexElement [
	index addLast: indexElement.
	data addLast: element
]

{ #category : #accessing }
KETimeSeries >> at: anIndex [
	^ data at: (index indexOf: anIndex)
	
]

{ #category : #accessing }
KETimeSeries >> compartment [
	^ compartment
]

{ #category : #accessing }
KETimeSeries >> compartment: aCompartment [
	compartment := aCompartment
]

{ #category : #accessing }
KETimeSeries >> data [
	^ data
]

{ #category : #accessing }
KETimeSeries >> data: anObject [
	data := anObject
]

{ #category : #accessing }
KETimeSeries >> index [
	^ index
]

{ #category : #accessing }
KETimeSeries >> index: anObject [
	index := anObject
]

{ #category : #accessing }
KETimeSeries >> indexMax [
	"This function will return the time value at which the data is max"
	^ index at: (data indexOf: data max)
]

{ #category : #accessing }
KETimeSeries >> indexMin [
	"This function will return the time value at which the data is min"
	^ index at: (data indexOf: data min)
]

{ #category : #accessing }
KETimeSeries >> indexOfTime: time [
	^ index indexOf: time ifAbsent: [ 
		1 to: index size do: [ :i| 
			(index at: i) > time ifTrue: [ ^ i ]
			]
		 ]
]

{ #category : #initialization }
KETimeSeries >> initialize [
	super initialize.
	data  := OrderedCollection new.
	index := OrderedCollection new
]

{ #category : #accessing }
KETimeSeries >> log [
	^ self class from: (data collect: [ :each | each perform: #log ]) withIndex: index copy compartment: self compartment
]

{ #category : #'as yet unclassified' }
KETimeSeries >> peakOfEpidemic [
	^ data max
]

{ #category : #action }
KETimeSeries >> save: fileName [
	"This function will save all data in a file as fileName.dat. The time col is first and next is the data col"
	|stream fileSystem workDir|
	fileSystem := FileSystem disk workingDirectory.
	workDir := fileSystem resolvePath: (fileSystem path / 'data').
	stream := (workDir / fileName) writeStream.
	1 to: (index size) do: [ :i|
		stream nextPutAll: (index at: i) asString, String tab, (data at: i) asString;cr.
		 ].
	stream close
]

{ #category : #accessing }
KETimeSeries >> size [
	^ data size
]

{ #category : #'mathematical functions' }
KETimeSeries >> sqrt [
	^ self class from: (data collect: [ :each | each perform: #sqrt ]) withIndex: index copy compartment: self compartment
]

{ #category : #'as yet unclassified' }
KETimeSeries >> timeAtPeakOfEpidemic [
	^ self indexMax
]
