tests
testNewTimeSeriesCollectionIsEmpty

| c |
c := KETimeSeriesCollection new.
self assert: c isEmpty equals: true
 