Class {
	#name : #KEMapBuilderTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KEMapBuilderTest >> testRoutesToTransitions [
	| m |
	m := KEMapBuilder new.
	m countries: #(#MyanmarBurma #Cambodia #Laos #Malaysia #Thailand #Vietnam).
	m routesFrom: #VietNam toAll: #(#Laos #Cambodia).
	m routesFrom: #Laos toAll: #(#Vietnam #Thailand #Cambodia).
	m routesFrom: #Cambodia toAll: #(Vietnam #Laos #Thailand).
	m routesFrom: #Thailand toAll: #(#Laos #Cambodia #MyanmarBurma #Malaysia).
	self assert: (m routesToTransitions: 'rho') size equals: 12
]
