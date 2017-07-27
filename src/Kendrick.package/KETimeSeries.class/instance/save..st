action
save: arg1
	| tmp1 tmp2 tmp3 tmp4 |
	tmp2 := FileSystem disk workingDirectory.
	tmp3 := tmp2 resolvePath: tmp2 path / 'data'.
	tmp1 := (tmp3 / arg1) writeStream.
	tmp4 := index size.
	1 to: tmp4 do: [ :tmp5 | 
		tmp1
			nextPutAll: (index at: tmp5) asString , String tab , (data at: tmp5) asString;
			cr ].
	tmp1 close