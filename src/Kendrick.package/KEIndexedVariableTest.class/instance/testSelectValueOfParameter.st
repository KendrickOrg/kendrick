tests
testSelectValueOfParameter
"self new testSelectValueOfParameter"
|model tmp|
model := self modelSIRMultiHost.

tmp := KEIndexedVariable new.
tmp symbol: #beta.
tmp addIndex: (KEVariable new symbol: #i).
tmp addIndex: (KEVariable new symbol: #c).  "c = 1"

"beta[i][1]"
self assert: (tmp evaluateWithModel: model) equals: #(0 0.02 0.02).