Class {
	#name : #K2ModelTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata'
}

{ #category : #tests }
K2ModelTest >> testAnSISModelHas2Transitions [

	| sisModel |
	sisModel := KEModel new
		            addAttribute: #status value: #( S I );
		            addTransitionFromState: { (#status -> #S) }
		            toState: { (#status -> #I) }
		            rate: [ :m | 
			            (m atParameter: #beta)
			            * (m atState: { (#status -> #I) })
			            / (m atParameter: #N) ];
		            addTransitionFromState: { (#status -> #I) }
		            toState: { (#status -> #S) }
		            rate: [ :m | m atParameter: #gamma ].

	self assert: sisModel transitions size equals: 2
]
