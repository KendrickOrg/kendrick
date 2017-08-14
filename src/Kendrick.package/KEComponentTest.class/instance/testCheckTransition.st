test
testCheckTransition
"self new testCheckTransition"
|model tr1 tr2 from1 from2 to1 to2|
model := self modelSIRKEModelMultiHosts.

tr1 := KETransition new.
tr2 := KETransition new.

from1 := Dictionary new.
from1 at: #status put:#empty.
to1 := Dictionary new.
to1 at: #status put: #S.
tr1 from: from1; to: to1.

from2 := Dictionary new.
from2 at: #status put: #empty;
		at: #species put: #mosquito.
to2 := Dictionary new.
to2   at: #status put: #S;
		at: #species put: #mosquito.
tr2 from: from2; to: to2.
		
self assert: (model checkTransition: tr1) equals: false.
self assert: (model checkTransition: tr2) equals: true.