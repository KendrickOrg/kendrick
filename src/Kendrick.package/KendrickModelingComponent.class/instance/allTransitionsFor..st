public-api
allTransitionsFor: aFromToList

		|from to propability|

		from := aFromToList first.
		propability := aFromToList second.
		to := aFromToList last.
		({ from . to } includes: #Empty) ifTrue: [ emptyRate := propability ].
		(self isAttribute: from)
			ifTrue: [ 
				(self allTransitionRefsForAttribute: from) do: [:fromRef |  
					backEndEntity
   						addTransitionFrom: fromRef
   						to: (self transitionRefFor: to)
   						probability: [ :m | m atParameter: propability ].			
				]
			]
			ifFalse: [ "to = all"
				(self isAttribute: to)
					ifTrue: [  
						(self allTransitionRefsForAttribute: from) do: [:toRef |  
							backEndEntity
   								addTransitionFrom: (self transitionRefFor: from)
   								to: toRef
   								probability: [ :m | m atParameter: propability ].			
						]
					] ifFalse: [ "no attributes"  
						backEndEntity
   								addTransitionFrom: (self transitionRefFor: from)
   								to: (self transitionRefFor: to)
   								probability: [ :m | m atParameter: propability ].
					]		
			 ] 
			
	