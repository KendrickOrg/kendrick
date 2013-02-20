as yet unclassified
atParameter: aParameter putExpression: anExpression

|p|
p:= (KEParameter new) symbol: aParameter; value: nil; expression: anExpression.
parameters at: aParameter put: p.