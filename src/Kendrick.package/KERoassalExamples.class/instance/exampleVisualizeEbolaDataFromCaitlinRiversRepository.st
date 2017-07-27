sources
exampleVisualizeEbolaDataFromCaitlinRiversRepository
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp9 tmp11 |
	tmp1 := RTTabTable new
		input:
			(ZnEasy
				get: 'https://raw.githubusercontent.com/cmrivers/ebola/master/country_timeseries.csv')
				contents
		usingDelimiter: $,.
	tmp1
		removeFirstRow;
		replaceEmptyValuesWith: '0' inColumns: (2 to: 12) asArray;
		convertColumnsAsInteger: (2 to: 12) asArray;
		convertColumnAsDateAndTime: 1;
		replaceZeroWithCumulativeValuesInColumns: (2 to: 12) asArray.
	tmp2 := tmp1 values reversed.
	tmp3 := tmp2 minValue: [ :arg1 | arg1 first julianDayNumber ].
	tmp4 := RTGrapher new.
	tmp4 extent: 300 @ 200.
	tmp6 := RTStackedDataSet new.
	tmp6 dotShape ellipse size: 0.
	tmp6
		points: tmp2;
		connectColor: Color blue;
		y: [ :arg2 | arg2 at: 3 ];
		x: [ :arg3 | arg3 first julianDayNumber - tmp3 ].
	tmp4 add: tmp6.
	tmp7 := RTStackedDataSet new.
	tmp7 dotShape ellipse size: 0.
	tmp7
		points: tmp2;
		connectColor: Color green;
		y: [ :arg4 | arg4 at: 4 ];
		x: [ :arg5 | arg5 first julianDayNumber - tmp3 ].
	tmp4 add: tmp7.
	tmp9 := tmp4 axisY.
	tmp9
		noDecimal;
		title: 'cases'.
	tmp11 := tmp4 axisX.
	tmp11
		labelRotation: -30;
		labelConvertion: [ :arg6 | Date julianDayNumber: arg6 + tmp3 ].
	tmp4 build.
	tmp5 := RTLegendBuilder new.
	tmp5
		view: tmp4 view;
		addText: 'Ebola cases';
		addColor: Color blue text: 'Guinea';
		addColor: Color green text: 'Liberia';
		build.
	^ tmp4 view