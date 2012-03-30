
!KEEventTest methodsFor: 'as yet unclassified'!
testCreateAnEventThatRemoveAnIndividualFromStatusS

|e|
e := KEEvent new.
e removeOneIndividualFrom: #S.
self assert: (e isRemovingOneIndividualFrom: #S) equals: true.
! !
