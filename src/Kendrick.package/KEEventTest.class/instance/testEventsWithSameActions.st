tests
testEventsWithSameActions

| e1 e2 listEvents |
e1 := KEEvent new.
e2 := KEEvent new.

e1 actions at: #S put: 1; at: #I put: -1.
e2 actions at: #I put: -1; at: #S put: 1.

listEvents := OrderedCollection new.
listEvents add: e1.
self assert: true equals: (e2 hasAnEventWithSameActionsIn: listEvents)