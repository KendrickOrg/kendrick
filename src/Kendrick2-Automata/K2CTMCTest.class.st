Class {
	#name : #K2CTMCTest,
	#superclass : #TestCase,
	#category : #'Kendrick2-Automata-Tests'
}

{ #category : #tests }
K2CTMCTest >> testCreateCTMC [ 

<gtExample>
| automaton1 automaton2 automaton3 |

automaton1 := K2CTMC
		     newFromArray:
		     			#( #(0) ).
		
automaton2 := K2CTMC
		       newFromArray:
		        		#( #( -1 1 0 0 ) 
		               #( 5 -10 5 0 ) 
		               #( 0 8 -12 4 )
		               #( 0 0 10 -10 ) 
		             ).
		
automaton3 := K2CTMC
		            newFromArray:
		            #( #( -1 1 0  ) 
		               #( 5 -10 5 ) 
		               #( 0 8 -12 )
		             ).
		
self assert: (automaton1  class = K2CTMC).
self assert: (automaton2  class = K2CTMC).
self assert: (automaton3  class = K2CTMC).
^automaton1

]

{ #category : #tests }
K2CTMCTest >> testNumberStatesOfCTMC [
	<gtExample>
	| automata1 automata2 automata3 |
	
	automata1 := K2CTMC
		            newFromArray:
		            #( #(0) ).
	
		
	automata2 := K2CTMC
		            newFromArray:
		            #( #( -1 1 0 0 ) 
		               #( 5 -10 5 0 ) 
		               #( 0 8 -12 4 )
		               #( 0 0 10 -10 ) 
		             ).
		
	automata3 := K2CTMC
		            newFromArray:
		            #( #( -1 1 0  ) 
		               #( 5 -10 5 ) 
		               #( 0 8 -12 )
		             ).
		
		
	self assert: (automata1 states size) equals: 1.
	self assert: (automata2 states size) equals: 4.
	self assert: (automata3 states size) equals: 3.
]

{ #category : #tests }
K2CTMCTest >> testStep [

	| automata |
	automata := K2CTMC
		            newFromArray:
		            #( #( -1 1 0 0 ) #( 5 -10 5 0 ) #( 0 8 -12 4 )
		               #( 0 0 10 -10 ) )
		            initialState: 1.
	automata step.
	self assert: (#( 1 2) includes: (automata currentState))
]

{ #category : #tests }
K2CTMCTest >> testStep1 [

	| automata |
	automata := K2CTMC
		            newFromArray:
		            #( #(0) )
		            initialState: 1.
	automata step.
	self assert: (automata currentState) equals:1
]
