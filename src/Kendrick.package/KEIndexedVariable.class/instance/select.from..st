private
select: indexValues from: anArray
	"Chua on :("
	anArray isNumber ifTrue: [ ^anArray  ].
	indexValues isEmpty  
	ifTrue: [ 
		^anArray. 
		]
	ifFalse: [  
		|count temp arr|
		arr := indexValues at: 1.
		arr isArray 
		ifTrue: [ 
			temp := Array new: (arr size). 
			count := 1.
			arr do: [ 
				:each|
				|t newIndexValues|
				(each <= anArray size)
				ifTrue: [  
					newIndexValues := indexValues copy.
					newIndexValues removeAtIndex: 1.
					t := self select: newIndexValues from: (anArray at: each).
					temp isArray ifTrue: [ temp at: count put: t. ].
			
					count := count + 1.
					].
			 	].
			] "Endof arr isArray ifTrue: [ "
			ifFalse: [ 
				temp := (anArray at: arr).
			]. "Endof arr isArray ifFalse: [ "
		^temp.
		]."endof ifFalse: ["  
	^nil.
