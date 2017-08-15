private
calculate: left with: right at: indexValues andStoreIn: anArray
	"Created by ThanhNT 26/7/17"
	|u v count tmp otherIndex|
	left isNumber ifTrue:[
		v := right.
		v isNumber ifFalse:
			[ 
				indexValues do: [ :each| v := v at: each ].
			].
		u := anArray.
		count := 0.
		(indexValues size = 1)
			ifTrue: [  
					u at: (indexValues at: 1) put: (self operateBetween: left and: v).
				]
			ifFalse: [  
				indexValues do: [ :each| 
					count := count + 1.
					u := u at: each. 
					count = ((indexValues size) - 1) 
						ifTrue: [ u at: (indexValues at: (count + 1)) 
										put: (self operateBetween: left and: v). ]
					].
			].
		]"endOf	left isNumber ifTrue:["
	
		ifFalse: [ 
			tmp := 0.
			left do: [ :each| 
				tmp := tmp + 1.
				otherIndex := OrderedCollection new.
				indexValues do: [ :elem| otherIndex add: elem ].
				otherIndex add: tmp.
				self calculate: each with: right at: otherIndex andStoreIn: anArray 
				]				
		 ].
	"^anArray ."