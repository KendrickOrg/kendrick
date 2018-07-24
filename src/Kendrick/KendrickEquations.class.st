Class {
	#name : #KendrickEquations,
	#superclass : #Object,
	#instVars : [
		'eqAsSymExpr'
	],
	#category : #'Kendrick-DSL-Internal'
}

{ #category : #'as yet unclassified' }
KendrickEquations >> convertToCompatibleBackendRepresentation [

	^ ((eqAsSymExpr asString
			copyReplaceAll: '#' with: '' asTokens: false)
			trimBoth: [ :c | (c = $() | (c = $)) ]) 
			findTokens: '''.'''
]

{ #category : #'as yet unclassified' }
KendrickEquations >> with: symExpression [

	eqAsSymExpr := symExpression 
]
