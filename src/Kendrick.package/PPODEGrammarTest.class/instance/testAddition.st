tests
testAddition

self parse: '3+4' rule: #addition.
self parse:'3 + 4' rule:#addition..
self parse:'a+b' rule:#addition.
self parse:'gamma+beta+gamma' rule:#addition.
self parse:'beta*S*I-gamma*I' rule:#addition.
self parse:'-(beta+7)' rule:#addition.

self parse:'a-b' rule:#addition.