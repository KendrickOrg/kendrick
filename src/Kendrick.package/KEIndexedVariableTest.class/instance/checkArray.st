as yet unclassified 
checkArray
	"self new checkArray"
	|u v|
	"u := #(  #(1 2) #(3 4) #(5 6)).
	v := 2.
	indexValues := #(2 1).
	temp := u.
	indexValues do: [ :each| temp := temp at: each ].
	temp := temp * v.
	^v."
	u := KEIndexedValue new.
	u value: #( #(1 2) #(3 4) #(5 6)).
	"v := #(1 2 3 4 5)."
	v := #( #(1 2) #(3 4) #(5 6)).
	u operator: #* with: v.
	^(u value).