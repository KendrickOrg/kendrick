as yet unclassified
atParameter: aParameter put:aValue

"parameters at:aParameter put: aValue"
|p|
p:=(KEParameter new) symbol: aParameter; value: aValue; expression: nil.
parameters at: aParameter put: p.