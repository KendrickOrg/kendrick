as yet unclassified
testParameterAsArray 

|model|

model := KEIndexedModel new.
model atParameter: #gamma put: #(1 2 3). 
model atParameter:#beta put: #((80 90 100) (110 120 130)).
self assert: (model atParameter: #gamma at: 2) equals: 2.
self assert: (model atParameter: #beta at: 2 at: 1) equals: 110.


