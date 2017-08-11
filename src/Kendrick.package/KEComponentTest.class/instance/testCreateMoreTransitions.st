test
testCreateMoreTransitions
"self new testCreateMoreTransitions"
|model tr trs from to|
model := self modelSIRKEModelMultiHosts.

tr := KETransition new.

from := Dictionary new.
from at: #status put:#empty.
to := Dictionary new.
to at: #status put: #S.
tr from: from; to: to.

trs := model createMoreTransitions: tr.

self assert: (trs size) equals: 3.
self assert: (((trs at: 1) from) at: #species) equals: #mosquito.
self assert: (((trs at: 2) from) at: #species) equals: #reservoir1.
self assert: (((trs at: 3) from) at: #species) equals: #reservoir2.