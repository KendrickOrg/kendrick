tests
testAtParameterAssignValue
	|model|
	model := KEModel new.
	model addParameters: { #beta->0.01. #gamma->0.02 }.
	self assert: (model atParameter: #beta) equals: 0.01.
	model atParameter: #beta 
			assignValue: 
			[ :aModel| |c| 
				c := aModel currentCompartment at: #species.
				c = #mosquito ifTrue: [ ^ 0.03 ].
				c = #reservoir1 ifTrue: [ ^ 0.005 ].
				c = #reservoir2 ifTrue: [ ^ 0.001 ]
			].
	model currentCompartment: (Dictionary newFrom: {#status->#S. #species->#mosquito}).
	self assert: (model atParameter: #beta) equals: 0.03.