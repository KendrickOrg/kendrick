"
A PPODEGrammar consists of all syntax rule of the PPODEParser .

Instance Variables
	addition:		<Object>
	cos:		<Object>
	equation:		<Object>
	exp:		<Object>
	expression:		<Object>
	factors:		<Object>
	identifier:		<Object>
	identifier2:		<Object>
	index:		<Object>
	log:		<Object>
	multiplication:		<Object>
	number:		<Object>
	odequation:		<Object>
	parenthesis:		<Object>
	power:		<Object>
	primary:		<Object>
	simpleEquation:		<Object>
	sin:		<Object>
	squarebrackets:		<Object>
	sum:		<Object>
	terms:		<Object>
	unary:		<Object>

addition
	- xxxxx

cos
	- xxxxx

equation
	- xxxxx

exp
	- xxxxx

expression
	- xxxxx

factors
	- xxxxx

identifier
	- xxxxx

identifier2
	- xxxxx

index
	- xxxxx

log
	- xxxxx

multiplication
	- xxxxx

number
	- xxxxx

odequation
	- xxxxx

parenthesis
	- xxxxx

power
	- xxxxx

primary
	- xxxxx

simpleEquation
	- xxxxx

sin
	- xxxxx

squarebrackets
	- xxxxx

sum
	- xxxxx

terms
	- xxxxx

unary
	- xxxxx

"
Class {
	#name : #PPODEGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'number',
		'terms',
		'parenthesis',
		'identifier',
		'identifier2',
		'multiplication',
		'power',
		'addition',
		'factors',
		'primary',
		'unary',
		'equation',
		'sin',
		'cos',
		'log',
		'squarebrackets',
		'index',
		'sum',
		'exp',
		'simpleEquation',
		'odequation',
		'expression'
	],
	#category : 'Kendrick-ODE-Parser'
}

{ #category : #grammar }
PPODEGrammar >> addition [
	^ factors separatedBy: ($+ asParser / $- asParser) token trim
]

{ #category : #grammar }
PPODEGrammar >> cos [
	^ $c asParser trim, $o asParser trim, $s asParser trim, $( asParser trim, terms , $) asParser trim
	
]

{ #category : #grammar }
PPODEGrammar >> equation [
   ^ odequation / simpleEquation 
]

{ #category : #grammar }
PPODEGrammar >> exp [
	^ $e asParser trim, $x asParser trim, $p asParser trim, $( asParser trim, terms , $) asParser trim
	
]

{ #category : #grammar }
PPODEGrammar >> expression [
    ^ addition / factors
]

{ #category : #grammar }
PPODEGrammar >> factors [
	^ multiplication / power
]

{ #category : #grammar }
PPODEGrammar >> identifier [
   ^ #letter asParser , #word asParser star
]

{ #category : #grammar }
PPODEGrammar >> identifier2 [
   ^ squarebrackets / identifier
]

{ #category : #grammar }
PPODEGrammar >> index [
   ^ number / identifier
]

{ #category : #grammar }
PPODEGrammar >> log [
	^ $l asParser trim, $o asParser trim, $g asParser trim, $( asParser trim, terms , $) asParser trim
	
]

{ #category : #grammar }
PPODEGrammar >> multiplication [
	^ power separatedBy: ($* asParser / $/ asParser) token trim
	
]

{ #category : #grammar }
PPODEGrammar >> number [
	^ ($- asParser optional , #digit asParser plus , ($. asParser , #digit asParser plus) optional) token trim
]

{ #category : #grammar }
PPODEGrammar >> odequation [
   ^ identifier2 token trim, $: asParser token trim, identifier token trim, $= asParser token trim, terms
]

{ #category : #grammar }
PPODEGrammar >> parenthesis [
^ $( asParser trim , terms , $) asParser trim
]

{ #category : #grammar }
PPODEGrammar >> power [
	^ primary separatedBy: $^ asParser token trim
]

{ #category : #grammar }
PPODEGrammar >> primary [
	^ sum / sin / cos / log / exp / squarebrackets / number / identifier / unary / parenthesis
]

{ #category : #grammar }
PPODEGrammar >> simpleEquation [
   "^identifier token trim, ($[ asParser token trim, index token trim, ($, asParser token trim, index token trim) plus optional, $] asParser token trim) optional, ($: asParser token trim , identifier token trim) optional , $= asParser token trim, terms"
	^ identifier2 token trim, $= asParser token trim, terms
]

{ #category : #grammar }
PPODEGrammar >> sin [
	^ $s asParser trim, $i asParser trim, $n asParser trim, $( asParser trim, terms , $) asParser trim
	
]

{ #category : #grammar }
PPODEGrammar >> squarebrackets [
	"^ identifier token trim, $[ asParser token trim , addition token trim , ($, asParser token trim, addition token trim) plus optional, $] asParser token trim"
	"^ identifier token trim, $[ asParser token trim , terms token trim , ($, asParser token trim, terms token trim) plus optional, $] asParser token trim"
	^ identifier token trim, $[ asParser token trim, terms token trim, $] asParser token trim, ($[ asParser token trim, terms token trim, $] asParser token trim) plus optional 
]

{ #category : #grammar }
PPODEGrammar >> start [
	^ equation / expression end
]

{ #category : #grammar }
PPODEGrammar >> sum [
	^ $s asParser token trim, $u asParser token trim, $m asParser token trim, $( asParser token trim, identifier token trim, $, asParser token trim, terms, $) asParser token trim
]

{ #category : #grammar }
PPODEGrammar >> terms [
	^ addition / factors
]

{ #category : #grammar }
PPODEGrammar >> unary [
   ^ $- asParser trim , primary
]
