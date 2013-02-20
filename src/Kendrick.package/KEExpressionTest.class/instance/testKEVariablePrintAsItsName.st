tests
testKEVariablePrintAsItsName

|beta|
beta := KEVariable symbol:#beta.
self assert: 'beta' equals: beta asString.