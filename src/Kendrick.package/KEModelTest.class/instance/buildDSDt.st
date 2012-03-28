as yet unclassified
buildDSDt

| dsdt expbin1 expbin2 m1 m2 vars vari beta u |
dsdt := KEEquation new.
expbin1 := KEBinaryExpression new.
expbin2 := KEBinaryExpression new.

m1 := (KEOperator new) symbol:#*.
m2 := (KEOperator new) symbol:#*.
vars := (KEVariable new) symbol:#S.
vari := (KEVariable new) symbol:#I.
beta := (KEVariable new) symbol:#beta.
u := (KEUnaryExpression new).
u op:#-; expression: beta.

expbin2 op:m1; leftHandSide: vars; rightHandSide: vari.
expbin1 op:m2; leftHandSide: u; rightHandSide: expbin2.

dsdt variable:vars; expression: expbin1.

^dsdt
