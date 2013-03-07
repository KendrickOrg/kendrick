as yet unclassified
selectTransitionIn: list haveStatus: status withSpecieID: specieID

|transitions|

transitions := Bag new.
list do:[:each|
	((each fromStatus symbol = status)&(each eqIndex = specieID)) ifTrue: [transitions add: each].
	].
^transitions