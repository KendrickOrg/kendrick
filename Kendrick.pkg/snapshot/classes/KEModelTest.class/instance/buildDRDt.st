
!KEModelTest methodsFor: 'as yet unclassified'!
buildDRDt

| drdt vari m3 gamma gammaI |
drdt := KEEquation new.

vari := (KEVariable new) symbol:'I'.
m3 := (KEOperator new) symbol:#*.
gamma := (KEVariable new) symbol:#gamma.

gammaI := KEBinaryExpression new.
gammaI op: m3; leftHandSide:gamma; rightHandSide:vari.

drdt variable: vari; expression: gammaI.
^ drdt
! !
