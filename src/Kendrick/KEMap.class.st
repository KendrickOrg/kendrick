"
A subclass of KEGraph used to represent a map of countries
 
Internal Representation and Key Implementation Points.

    Instance Variables
	countries:		<Object>


    Implementation Points
"
Class {
	#name : #KEMap,
	#superclass : #KEGraph,
	#instVars : [
		'countries'
	],
	#category : #'Kendrick-Core-Spatial'
}

{ #category : #'as yet unclassified' }
KEMap class >> africa [
	^ KEMap countries: #(#Nigeria #Ethiopia #Egypt #DemocraticRepublicCongo #SouthAfrica #Tanzania #Kenya #Algeria #Uganda #Sudan #Morocco #Ghana #Mozambique #IvoryCoast #Madagascar #Angola #Cameroon #Niger #BurkinaFaso #Mali #Malawi #Zambia #Senegal #Zimbabwe #Chad #Guinea #Tunisia #Rwanda #Benin #Somalia #Burundi #Togo #Libya #SierraLeone #CentralAfricanRepublic #Eritrea #Congo #Liberia #Mauritania #Gabon #Namibia #Botswana #Lesotho #EquatorialGuinea #Gambia #GuineaBissau #Swaziland #Djibouti #WesternSahara)
]

{ #category : #'as yet unclassified' }
KEMap class >> countries: aCollection [
	^ KEMap new countries: aCollection
]

{ #category : #'as yet unclassified' }
KEMap class >> southAmerica [
	^ KEMap countries: #(#Argentina #Brazil #Bolivia #Chile #Colombia #Ecuador #Guyana #FrenchGuyana #Paraguay #Peru #Suriname #Uruguay #Venezuela)
]

{ #category : #'as yet unclassified' }
KEMap class >> southeastAsia [
	^ KEMap countries: #(#BruneiDarussalam #MyanmarBurma #Cambodia #TimorLeste #Indonesia #Laos #Malaysia #Philippines #Singapore #Thailand #Vietnam).
]

{ #category : #'as yet unclassified' }
KEMap >> countries [
	^ countries
]

{ #category : #'as yet unclassified' }
KEMap >> countries: aCollection [
	countries := aCollection
]

{ #category : #'as yet unclassified' }
KEMap >> initialize [
	super initialize.
	countries := OrderedCollection
]

{ #category : #'as yet unclassified' }
KEMap >> routesFrom: aCountryName toAll: countryNames [
	countryNames do: [ :toCountryName|
		edges add: aCountryName -> toCountryName ]
]

{ #category : #'as yet unclassified' }
KEMap >> routesToTransitions: aBlockOrAnExpression [
	|transitions|
	transitions := edges collect: [ :each|
		KETransition 
			from: { #country->each key } 
			to: { #country->each value } 
			probability: aBlockOrAnExpression 	
	].
	^ transitions
]
