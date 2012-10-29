as yet unclassified
evaluateWithModel: aModel

|index1 index2 x|

index1 := (self calculateValueOfIndex: idExpression1 with: aModel).
idExpression2 = -1 ifTrue: [index2 := -1] ifFalse: [
	index2 := (self calculateValueOfIndex: idExpression2 with: aModel).
	index2 < 0 ifTrue: [index2 := 0]
	].
"self halt."
(index2 = -1) ifTrue: [
	(index1 <= 0) ifTrue: [^0].
	x := (aModel atParameter: symbol at: index1).
	x ifNil: [x := ((aModel atCompartment: symbol) numberOfIndividuals) at: index1]
	] ifFalse: [
	((index1 <= 0) | (index2 <= 0)) ifTrue: [^0].
	x := (aModel atParameter: symbol at: index1 at: index2).
	].
"self halt."
^x.
