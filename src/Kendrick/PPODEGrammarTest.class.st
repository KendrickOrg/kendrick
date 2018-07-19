Class {
	#name : #PPODEGrammarTest,
	#superclass : #PPCompositeParserTest,
	#category : 'Kendrick-Tests-ODE-Parser'
}

{ #category : #accessing }
PPODEGrammarTest >> parserClass [
	^ PPODEGrammar
]

{ #category : #tests }
PPODEGrammarTest >> testAddition [
	self parse: '3+4' rule: #addition.
	self parse: '3 + 4' rule: #addition.
	self parse: 'a+b' rule: #addition.
	self parse: 'gamma+beta+gamma' rule: #addition.
	self parse: 'beta*S*I-gamma*I' rule: #addition.
	self parse: '-(beta+7)' rule: #addition.
	self parse: 'a-b' rule: #addition
	
]

{ #category : #tests }
PPODEGrammarTest >> testCos [
	self parse: 'cos(t)' rule: #cos.
	self parse: 'cos(-(beta + 5))' rule: #cos
]

{ #category : #tests }
PPODEGrammarTest >> testEquation [
	self parse: 'S:t = -beta * S * I' rule: #equation.
	self parse: ' S:t = -beta * S * I' rule: #equation.
	self parse: 'I:t = beta * S * I - gamma * I' rule: #equation.
	self parse: 'R:t = gamma * I' rule: #equation
]

{ #category : #tests }
PPODEGrammarTest >> testExp [
	self parse: 'exp(t)' rule: #exp.
	self parse: 'exp(-(beta + 5))' rule: #exp
]

{ #category : #tests }
PPODEGrammarTest >> testExpression [
	self parse: '-beta * S * I' rule: #expression.
	self parse: 'beta * S * I - gamma * I' rule: #expression.
	
]

{ #category : #tests }
PPODEGrammarTest >> testIdentifier [
	self parse: 'beta' rule: #identifier.
	self parse: 'gamma' rule: #identifier.
	self parse: 'a1' rule: #identifier.
	self fail: '11b' rule: #identifier
]

{ #category : #tests }
PPODEGrammarTest >> testLog [
	self parse: 'log(t)' rule: #log.
	self parse: 'log(-(beta + 5))' rule: #log
]

{ #category : #tests }
PPODEGrammarTest >> testMultiplication [
	self parse: '3*4' rule: #multiplication.
	self parse: '3*a' rule: #multiplication.
	self parse: 'gamma*I' rule: #multiplication.
	self parse: 'gamma*beta*gamma' rule: #multiplication.
	self parse: '-beta*S*I' rule: #multiplication.
	self parse: 'a/b' rule: #multiplication
]

{ #category : #tests }
PPODEGrammarTest >> testNumber [
	self parse: '0' rule: #number.
	self parse: '0.0' rule: #number.
	self parse: '1.2' rule: #number.
	self parse: '34' rule: #number.
	self parse: '56.78' rule: #number.
	self parse: '-9' rule: #number.
	self parse: '-9.9' rule: #number.
	self fail: '3..3' rule: #number
]

{ #category : #tests }
PPODEGrammarTest >> testOdequation [
	self parse: 'S:t = -beta * S * I' rule: #odequation.
	self parse: ' S[i]:t = -beta * cos(i*j)' rule: #odequation.
	
]

{ #category : #tests }
PPODEGrammarTest >> testParenthesis [
	self parse: '(0)' rule: #parenthesis.
	self parse: '(1)' rule: #parenthesis.
	self parse: '(a)' rule: #parenthesis.
	self parse: '(a+b)' rule: #parenthesis.
	self parse: '((a))' rule: #parenthesis.
	self fail: ')a(' rule: #parenthesis
]

{ #category : #tests }
PPODEGrammarTest >> testPower [
	self parse: '3^4' rule: #power.
	self parse: 'a^2' rule: #power
]

{ #category : #tests }
PPODEGrammarTest >> testPrimary [
	self parse: '(0)' rule: #primary.
	self parse: 'toto' rule: #primary.
	self parse: '(xxx)' rule: #primary.
	self parse: '1' rule: #primary.
	self parse: '1.2' rule: #primary.
	self parse: '((34))' rule: #primary
]

{ #category : #tests }
PPODEGrammarTest >> testSimpleEquation [
	self parse: 'S = -beta * S * I' rule: #simpleEquation.
	self parse: ' beta[i][j] = -beta * cos(i*j)' rule: #simpleEquation.
	
]

{ #category : #tests }
PPODEGrammarTest >> testSin [
	self parse: 'sin(t)' rule: #sin.
	self parse: 'sin(-(beta + 5))' rule: #sin
]

{ #category : #tests }
PPODEGrammarTest >> testSquareBrackets [
	self parse: 'S[i]' rule: #squarebrackets.
	self parse: 'S[i][j]' rule: #squarebrackets.
	self parse: 'S[i][j][ k]' rule: #squarebrackets.
	self parse: 'S[i][j][ k][ l]' rule: #squarebrackets.
	self parse: 'S[1]' rule: #squarebrackets.
	self parse: 'S[1][ 3]' rule: #squarebrackets.
	self parse: 'S[1][ i]' rule: #squarebrackets.
	self parse: 'S[i-1][ j+1]' rule: #squarebrackets
]

{ #category : #tests }
PPODEGrammarTest >> testStart [
	self parse: 'S:t = -beta * S * I' rule: #start.
	self parse: ' S:t = -beta * S * I' rule: #start.
	self parse: 'I:t = beta * S * I - gamma * I' rule: #start.
	self parse: 'R:t = gamma * I' rule: #start
]

{ #category : #tests }
PPODEGrammarTest >> testSum [
	self parse: 'sum(j, beta[i][j]*I[j])' rule: #sum.
	self parse: 'sum(j, beta[i][j]*sum(k, I[k]))' rule: #sum
]

{ #category : #tests }
PPODEGrammarTest >> testUnary [
	self parse: '-beta' rule: #unary.
	self parse: '-(beta * 5)' rule: #unary
]
