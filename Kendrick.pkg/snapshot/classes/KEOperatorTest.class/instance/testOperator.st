
!KEOperatorTest methodsFor: 'as yet unclassified'!
testOperator
	| o |
	o := KEOperator new.
	o symbol:#+.
	self assert: o symbol = #+! !
