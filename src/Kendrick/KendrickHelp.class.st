Class {
	#name : #KendrickHelp,
	#superclass : #CustomHelp,
	#category : 'Kendrick-Help'
}

{ #category : #accessing }
KendrickHelp class >> bookName [
	^ 'Kendrick help'
]

{ #category : #pages }
KendrickHelp class >> license [
	"This method was automatically generated."
	<script: 'self edit: #license'>
	^HelpTopic
		title: 'Licence'
		contents: 
'Kendrick is available under the MIT licence.!' readStream nextChunkText
]

{ #category : #accessing }
KendrickHelp class >> pages [
	^ #(license)
]
