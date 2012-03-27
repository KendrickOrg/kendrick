as yet unclassified
testNumber

self parse:'0' rule: #number.
self parse: '0.0' rule:#number.
self parse: '1' rule: #number.
self parse: '1.2' rule:#number.
self parse: '34' rule:#number.
self parse: '56.78' rule:#number.
self parse: '-9' rule:#number.
self parse: '-9.9' rule:#number.

self fail:'3..3' rule:#number.