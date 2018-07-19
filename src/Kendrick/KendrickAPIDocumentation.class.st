Class {
	#name : #KendrickAPIDocumentation,
	#superclass : #KendrickHelp,
	#category : 'Kendrick-Help'
}

{ #category : #accessing }
KendrickAPIDocumentation class >> bookName [
	^ 'API Documentation'
]

{ #category : #defaults }
KendrickAPIDocumentation class >> builder [
	^ PackageAPIHelpBuilder
]

{ #category : #accessing }
KendrickAPIDocumentation class >> helpPackages [
	^ #('Kendrick')
]
