testing
sign

(op = #*) ifTrue: [^(rightHandSide sign) * (leftHandSide sign)] "ifFalse:[^0]" ifFalse: [^1]
"Modify ^1 for these cases with op = +, - for example: (A+B)*K"
