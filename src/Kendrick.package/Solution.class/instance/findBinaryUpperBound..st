as yet unclassified
findBinaryUpperBound: aBlock 
 "Search for an element in the receiver using binary search.
 The argument aBlock is a one-element block returning
  0  - if the element is the one searched for
  <0 - if the search should continue in the first half
  >0 - if the search should continue in the second half"
 | index low high test |
 low := 1.
 high := self size.
 [index := high + low // 2.
 low + 1 >= high] whileFalse:[
  test := aBlock value: (self at: index).
  test = 0 
   ifTrue:[high := index]
   ifFalse:[test > 0
    ifTrue: [low := index]
    ifFalse: [high := index]]].
 ^high