"
Abstract class for proportional selection 

Based on code from: [https://web.archive.org/web/20210424164451/https://thoughts.johnbnelson.com/fast_proportional_selection/](https://web.archive.org/web/20210424164451/https://thoughts.johnbnelson.com/fast_proportional_selection/)

# Methods 
`at:` returns the frequencies according to the position in the selection
`from:` initializes the proportional selection with a new collection of frequencies

`at:put:`, `normalize` and `sample` are abstract methods.

"
Class {
	#name : #KEProportionalSelection,
	#superclass : #Object,
	#instVars : [
		'frequencies'
	],
	#category : #'Kendrick-Core-Simulations'
}

{ #category : #'instance creation' }
KEProportionalSelection class >> from: aCollection [
	^ (self new) initialize: (aCollection size); from: aCollection
]

{ #category : #accessing }
KEProportionalSelection >> at: index [
	^ frequencies at: index
]

{ #category : #accessing }
KEProportionalSelection >> at:index put:value [

self subclassResponsibility 
]

{ #category : #accessing }
KEProportionalSelection >> from: aCollection [
aCollection doWithIndex:[:each :i| self at: i put: each]
	 
]

{ #category : #initialization }
KEProportionalSelection >> initialize: size [
	frequencies := Array new: size withAll:0
]

{ #category : #'as yet unclassified' }
KEProportionalSelection >> normalize [ 

self subclassResponsibility 
]

{ #category : #accessing }
KEProportionalSelection >> sample [ 
self subclassResponsibility 
]
