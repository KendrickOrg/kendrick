as yet unclassified
testMultiplication

self parse: '3*4' rule: #multiplication.
self parse:'3*a' rule:#multiplication.
self parse:'gamma*I' rule:#multiplication.
self parse:'gamma*beta*gamma' rule:#multiplication.
self parse:'-beta*S*I' rule:#multiplication.

self parse:'a/b' rule:#multiplication.
