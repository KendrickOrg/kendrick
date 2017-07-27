sources
exampleVisualizeEbolaFatalities
	| tmp1 tmp2 tmp3 tmp4 tmp6 tmp8 |
	tmp2 := RTTabTable new
		input: (ZnEasy get: 'http://bit.ly/EbolaCSV') contents
		usingDelimiter: $,.
	tmp2
		removeFirstRow;
		replaceEmptyValuesWith: '0' inColumns: #(10 11);
		convertColumnsAsInteger: #(10 11);
		convertColumnsAsDateAndTime: #(3 4).
	tmp4 := tmp2 values reversed.
	tmp1 := RTGrapher new.
	tmp1 extent: 400 @ 200.
	tmp3 := RTStackedDataSet new.
	tmp3 interaction fixedPopupText: [ :arg1 | arg1 value at: 12 ].
	tmp6 := tmp3 dotShape ellipse.
	tmp6
		color: (Color blue alpha: 0.3);
		size: [ :arg2 | (arg2 at: 11) / 5 ].
	tmp3
		points: tmp4;
		connectColor: Color blue;
		y: [ :arg3 | arg3 at: 10 ];
		highlightIf: [ :arg4 | (arg4 at: 10) > 100 ]
			using: [ :arg5 | arg5 third year ].
	tmp1 add: tmp3.
	tmp8 := tmp1 axisX.
	tmp8
		noLabel;
		numberOfTicks: tmp2 values size.
	tmp1 axisY noDecimal.
	tmp1 build.
	^ tmp1 view