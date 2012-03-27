as yet unclassified
buildDRDt

| drdt vari m3 gamma gammaI |
drdt := KEEquation new.

vari := (KEVariable new) name:'I'.
m3 := (KEOperator new) symbol:#*.
gamma := (KEVariable new) name:'gamma'.

gammaI := KEBinaryExpression new.
gammaI op: m3; leftHandSide:gamma; rightHandSide:vari.

drdt variable: vari; expression: gammaI.
^ drdt
