tests
testIdentifier

self parse: 'beta' rule: #identifier.
self parse: 'gamma' rule:#identifier.
self parse: 'a1' rule: #identifier.

self fail:'11b' rule:#identifier.
