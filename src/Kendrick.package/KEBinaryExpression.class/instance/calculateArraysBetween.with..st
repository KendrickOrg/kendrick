private
calculateArraysBetween: left with: right
	"Created by ThanhNT 26/7/17"
	|tmp|
	tmp := 0.
	left do: [ 
		:each|
		|t|
		tmp := tmp + 1.
		t := OrderedCollection new.
		t add: tmp.
		self calculate: each with: right at: t andStoreIn: left.
		 ].
	^left.