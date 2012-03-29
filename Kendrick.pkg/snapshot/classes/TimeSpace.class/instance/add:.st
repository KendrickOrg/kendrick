
!TimeSpace methodsFor: 'as yet unclassified'!
add: aTimeSpace
 "adding a TimeSpace"

 ^ TimeSpace 
  time: t + (aTimeSpace time)
  space: y + (aTimeSpace space)! !
