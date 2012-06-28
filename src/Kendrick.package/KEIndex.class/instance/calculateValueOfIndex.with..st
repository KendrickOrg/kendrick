as yet unclassified
calculateValueOfIndex: idExpression with: aModel

|idValue idExpr|
(idExpression size = 1) ifTrue: [
	idExpr:= (idExpression asSymbol).
	idExpr = (aModel eqIdVariable) ifTrue: [idValue:=(aModel eqIdValue)].
	idExpr = (aModel fnIdVariable) ifTrue: [idValue:=(aModel fnIdValue)].
	idValue isNil ifTrue: [idValue:=(idExpr asNumber)]							  
	]
ifFalse: [
	(idExpression size = 3) ifTrue: [
		|op idRighEx a b|
		idExpr := (idExpression at: 1) asSymbol.
		op := (idExpression at: 2) asSymbol.
		idRighEx := (idExpression at: 3) asSymbol.
		
		idExpr = (aModel eqIdVariable) ifTrue: [a :=(aModel eqIdValue)].
		idExpr = (aModel fnIdVariable) ifTrue: [a :=(aModel fnIdValue)].
		a isNil ifTrue: [a:=(idExpr asNumber)].
				
		idRighEx = (aModel eqIdVariable) ifTrue: [b :=(aModel eqIdValue)].
		idRighEx = (aModel fnIdVariable) ifTrue: [b :=(aModel fnIdValue)].
		b isNil ifTrue:[b:=(idRighEx asNumber)].
		
		op = #+ ifTrue: [idValue := (a + b)].
		op = #- ifTrue: [idValue := (a - b)].	
		]
	].

^idValue
