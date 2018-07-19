"
A map show the infection dynamic of an infectious disease
"
Class {
	#name : #KEMapBuilder,
	#superclass : #KEGraphBuilder,
	#instVars : [
		'countries',
		'routes',
		'map'
	],
	#category : 'Kendrick-Semantic-Model-Core'
}

{ #category : #'as yet unclassified' }
KEMapBuilder class >> africa [
	^ KEMapBuilder new countries: #(#Nigeria #Ethiopia #Egypt #DemocraticRepublicCongo #SouthAfrica #Tanzania #Kenya #Algeria #Uganda #Sudan #Morocco #Ghana #Mozambique #IvoryCoast #Madagascar #Angola #Cameroon #Niger #BurkinaFaso #Mali #Malawi #Zambia #Senegal #Zimbabwe #Chad #Guinea #Tunisia #Rwanda #Benin #Somalia #Burundi #Togo #Libya #SierraLeone #CentralAfricanRepublic #Eritrea #Congo #Liberia #Mauritania #Gabon #Namibia #Botswana #Lesotho #EquatorialGuinea #Gambia #GuineaBissau #Swaziland #Djibouti #WesternSahara)
]

{ #category : #'as yet unclassified' }
KEMapBuilder class >> southeastAsia [
	^ KEMapBuilder new countries: #(#BruneiDarussalam #MyanmarBurma #Cambodia #TimorLeste #Indonesia #Laos #Malaysia #Philippines #Singapore #Thailand #Vietnam).
]

{ #category : #'as yet unclassified' }
KEMapBuilder >> build [
	|b max cn countriesData|
	b := RTMapBuilder new.
	max := data max.
	countriesData := countries collect: [ :c| Array with: c with: (data at: (countries indexOf: c)) ].
	cn := RTMultiLinearColor new
		colors: (RTColorPalette sequential colors: 8 scheme: 'Reds');
		command: [ :aCountry | (countriesData detect: [ :c | c first = aCountry ]) second / max ].
	b countries: countries.
	b color: cn.
	b view @ RTZoomableView.
	^ b
]

{ #category : #'as yet unclassified' }
KEMapBuilder >> countries [
	^ countries
]

{ #category : #'as yet unclassified' }
KEMapBuilder >> countries: aCollection [
	countries := aCollection
]

{ #category : #'as yet unclassified' }
KEMapBuilder >> initialize [
	super initialize.
	countries := OrderedCollection new.
	routes := OrderedCollection new
]

{ #category : #'as yet unclassified' }
KEMapBuilder >> map [
	^ map
]

{ #category : #'as yet unclassified' }
KEMapBuilder >> map: aMap [
	map := aMap
]

{ #category : #'as yet unclassified' }
KEMapBuilder >> open [
	|b|
	b := self build.
	b build.
	b open
]

{ #category : #'as yet unclassified' }
KEMapBuilder >> routesFrom: aCountryName toAll: countryNames [
	countryNames do: [ :toCountryName|
		routes add: aCountryName -> toCountryName ]
]

{ #category : #'as yet unclassified' }
KEMapBuilder >> routesToTransitions: aBlockOrAnExpression [
	|transitions|
	transitions := routes collect: [ :each|
		KETransition 
			from: { #country->each key } 
			to: { #country->each value } 
			probability: aBlockOrAnExpression 	
	].
	^ transitions
]

{ #category : #'as yet unclassified' }
KEMapBuilder >> view [
	|b|
	b := self build.
	b build.
	^ b view
]
