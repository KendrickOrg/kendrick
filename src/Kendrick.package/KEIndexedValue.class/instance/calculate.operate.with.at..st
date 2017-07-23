private
calculate: left operate: op with: right at: indexValues
	|u v count tmp otherIndex|
	left isNumber ifTrue:[
		v := right.
		v isNumber ifFalse:
			[ 
				indexValues do: [ :each| v := v at: each ].
			].
		u := value.
		count := 0.
		(indexValues size = 1)
			ifTrue: [  
					value at: (indexValues at: 1) put: (self operate: op between: left and: v).
				]
			ifFalse: [  
				indexValues do: [ :each| 
					count := count + 1.
					u := u at: each. 
					count = ((indexValues size) - 1) 
						ifTrue: [ u at: (indexValues at: (count + 1)) 
										put: (self operate: op between: left and: v). ]
					].
			].
		]
		ifFalse: [ 
			tmp := 0.
			left do: [ :each| 
				tmp := tmp + 1.
				otherIndex := OrderedCollection new.
				indexValues do: [ :elem| otherIndex add: elem ].
				otherIndex add: tmp.
				self calculate: each operate: op with: right at: otherIndex
				]				
		 ].
		