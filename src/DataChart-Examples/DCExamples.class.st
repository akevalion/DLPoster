Class {
	#name : #DCExamples,
	#superclass : #Object,
	#category : #'DataChart-Examples'
}

{ #category : #examples }
DCExamples >> exampleDCBarPlotCustomStringDataX [
	<script: 'self new exampleDCBarPlotCustomStringDataX'>
	| x plot |
	x := #(1.33 1.35 0.93 4 6 6).
	plot := DCBarPlot new
			x: #('mama' 'papa' 'oncle' 'pipoune' 'tata' 'toto');
			y: x;
			yourself.
	^ plot show.
	
]

{ #category : #examples }
DCExamples >> exampleDCBarPlotCustomX [
	<script: 'self new exampleDCBarPlotCustomX'>
	| x plot bars window |
	x := #(1.33 1.35 0.93 1.08 1.28 1 1.5 1.93 8 2.8) sorted.
	plot := DCBarPlot new
			x: x;
			y: (1 to: 10);
			yourself.
	window := plot show.
	bars := plot kind bars.
	plot chart canvas signalUpdate.
	bars doWithIndex: [ :each :index |
		each draggable.
		each popupText: (x at: index) @ each model.
		each color: each color translucent ].
	plot chart canvas signalUpdate.
	^ window
]

{ #category : #examples }
DCExamples >> exampleDCBoxPlot [
	<script: 'self new exampleDCBoxPlot'>
	
	| y plot |
	y := { { 1. 2. 3. 4. 5. } . 
			 { 5. 6. 7. 5. 10. }  .
			 { 12. 12. 13. 14. 15. 24. }  }. 

	^ plot := DCBoxPlot new
		y: y;
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		title: 'Box Plot';
		name: ' Box Plot';
		withLegend;
		show.
]

{ #category : #examples }
DCExamples >> exampleDCClusterBarPlot [
	<script: 'self new exampleDCClusterBarPlot'>
	| x y plots perlin palette |
	perlin := NSPerlinNoise3 new octaves: 7.
	
	x := 0.0 to: 2 count: 6.
	palette := RSColorPalette sequential ylgnbu6.
	plots := (1 to: 4) collect: [ :index | 
		y := x collect: [ :n | (perlin noise: n and: index) ].
		DCBarPlot new
			y: y;
			color: (palette scale: y);
			yourself ].
	
	^ (DCClusterBarPlot withAll: plots)
		title: 'Cluster Bar Plot';
		show.
]

{ #category : #examples }
DCExamples >> exampleDCClusterBarPlotWithDecoration [
	<script: 'self new exampleDCClusterBarPlotWithDecoration'>
	| x y y2 plot1  plot2 y3 plot3 y4 plot4 decoration |

	x := 0.0 to: 2 count: 6.
	y := x raisedTo: 2.
	y2 := x raisedTo: 3.
	y3 := x raisedTo: 4.
	y4 := (x raisedTo: 5) +3.
	
	decoration := (DCLabelDecoration new
		text: 'Maximum value: ', ((2 raisedTo: 5) +3) asString;
		color: Color black;
		x: 2;
		y: (2 raisedTo: 5) +3;
    yourself ).

	plot1 := DCBarPlot new x:x ;y: y.
	plot2 := DCBarPlot new x:x;y: y2.
	plot3 := DCBarPlot new x:x; y: y3.
	plot4 := DCBarPlot new x:x; y: y4.
	
	 ^ DCClusterBarPlot new withAll: { plot1. plot2. plot3. plot4 };
		title: 'Cluster bar plot';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		add: decoration;
		show.
]

{ #category : #examples }
DCExamples >> exampleDCCombinePlot [
	<script: 'self new exampleDCCombinePlot'>
	| x line1 line2 line3 combined |

	x := 0.0 to: 2 count: 100.

	line1 := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		yourself.

	line2 := DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		name: 'covid evolution';
		yourself.
	
	combined := DCCombinePlot new withAll: { line1. line2.}.
	
	line3 := DCScatterPlot new
		x: x;
		y: (x raisedTo: 4);
		color: Color blue;
		yourself.
	combined add: line3.
	^ combined 
		title: 'Combined plot';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		legendDo: [ : legend|
			legend location inner top offset: 10];
		show.
]

{ #category : #examples }
DCExamples >> exampleDCCombinePlotWithVerticalLineDecoration [
	<script: 'self new exampleDCCombinePlotWithVerticalLineDecoration'>
	| x line1 line2 line3 combined decoration |

	x := 0 to: 100.
	decoration := DCVerticalLineDecoration new color: Color blue.
	decoration x: 70.

	line1 := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		yourself.

	line2 := DCLinePlot new
		x: x;
		y: (x raisedTo: 3.8);
		yourself.
	
	line3 := DCScatterPlot new
		x: x;
		y: (x raisedTo: 4);
		color: Color green;
		yourself.
	
	combined := DCCombinePlot new withAll: { line1. line2. line3 }.
	^ combined 
		title: 'Line decoration';
		add: decoration;
		extent: 600@400;
		show.
]

{ #category : #examples }
DCExamples >> exampleDCHistogram [
	<script: 'self new exampleDCHistogram'>
	| x bins |
	bins := #(12 34 54 80).
	x :=  self randomValues.
	^ DCHistogramPlot new
		x: x;
		title: 'Histogram';
		xlabel: 'Axis X';
		ylabel: 'Axis y';
		numberOfBins: 19;
		show
]

{ #category : #examples }
DCExamples >> exampleDCHistogramBin [
	<script: 'self new exampleDCHistogramBin'>
	| x |
	x :=  self randomValues.
	^ DCHistogramPlot new
		x: x;
		title: 'Histogram';
		numberOfBins: 20;
		show
]

{ #category : #examples }
DCExamples >> exampleDCHistogramBinSize [
	<script: 'self new exampleDCHistogramBin'>
	| x |
	x :=  self randomValues.
	^ DCHistogramPlot new
		x: x;
		title: 'Histogram';
		binSize: 10;
		show
]

{ #category : #examples }
DCExamples >> exampleDCHistogramCustomBins [
	<script: 'self new exampleDCHistogramCustomBins'>
	| x |
	x :=  self randomValues.
	^ DCHistogramPlot new
		x: x;
		title: 'Histogram';
		bins: #(100 140 150 200);
		show
]

{ #category : #examples }
DCExamples >> exampleDCHistogramWithDecoration [
	<script: 'self new exampleDCHistogramWithDecoration'>
	| x decoration |
	x := self randomValues.
	decoration := (DCLabelDecoration new
		text: 'Middle area';
		x: 175;
		y: 80;
    yourself ).
	^ DCHistogramPlot new
		x: x;
		xlabel: 'Axis X';
		ylabel: 'Axis y';
		add: decoration;
		show
]

{ #category : #examples }
DCExamples >> exampleDCLine [
	<script: 'self new exampleDCLine'>
	| x |
	x := 1 to: 100.
	^ DCLinePlot new
		x: x;
		y: (x raisedTo: 2); 
		color: Color green;
		show.
]

{ #category : #examples }
DCExamples >> exampleDCLineWithLabelDecoration [
	<script: 'self new exampleDCLineWithLabelDecoration'>
	| x y decoration |
	x := 1 to: 100.
	y := x raisedTo: 3.
	decoration := (DCLabelDecoration new
		text: 'Middle';
		x: 50;
		y: (50 raisedTo: 3);
    yourself ).

	^ DCLinePlot new
		x: x;
		y: y;
		add: decoration;
		show.
]

{ #category : #examples }
DCExamples >> exampleDCLineWithVerticalLineDecoration [
	<script: 'self new exampleDCLineWithVerticalLineDecoration'>
	| x decoration |
	decoration := DCVerticalLineDecoration new.
	decoration x: 70.
	x := 1 to: 100.
	^ DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		title: 'DCLinePlot';
		xlabel: 'line x';
		ylabel: 'line y';
		add: decoration;
		show
]

{ #category : #examples }
DCExamples >> exampleDCScatter [
	<script: 'self new exampleDCScatter'>
	| x |

	x := 0.0 to: 2 count: 100.

	^ DCScatterPlot new
		x: x;
		y: (x raisedTo: 2); 
		title: 'Scatter plot';
		show.
]

{ #category : #examples }
DCExamples >> exampleDCStackBarPlot [
	<script: 'self new exampleDCStackBarPlot'>
	| x y plots perlin |
	perlin := NSPerlinNoise3 new octaves: 7.
	
	x := 0.0 to: 2 count: 10.
	plots := (1 to: 4) collect: [ :index | 
		y := x collect: [ :n | (perlin noise: n and: index) ].
		DCBarPlot new
			y: y;
			yourself ].

	 ^ (DCStackBarPlot withAll: plots)
		title: 'Stack Bar Plot';
		padding: 0.3;
		show.
]

{ #category : #examples }
DCExamples >> exampleDCStackBarPlotWithDecoration [
	<script: 'self new exampleDCStackBarPlotWithDecoration'>
	| x y y2 plot1  plot2 y3 plot3 decoration |

	x := 0.0 to: 2 count: 10.
	y := x raisedTo: 2.
	y2 := x raisedTo: 3.
	y3 := x raisedTo: 4.
	decoration := (DCLabelDecoration new
		text: 'Maximum';
		x: 10;
		y: 5;
    yourself ).
	
	plot1 := DCBarPlot new.
	plot1 y: y.
	plot2 := DCBarPlot new.
	plot2 y: y2.
	plot3 := DCBarPlot new y:y3.
	
"combined := DCCombinePlot new."

	 ^ DCStackBarPlot new withAll: { plot1. plot2. decoration };
		add: plot3;
		title: 'Hello world';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		show.
]

{ #category : #examples }
DCExamples >> normal: x mean: mean stdDev: std [
	^ (-0.5 * Float twoPi log - std log -
		 ( ((x - mean) raisedTo: 2) / (2 * std * std))) exp
]

{ #category : #examples }
DCExamples >> randomValues [
	<script: 'self new randomValues inspect'>
	^ self randomValues: 170 scale: 10 size: 250.
]

{ #category : #examples }
DCExamples >> randomValues: loc scale: scale size: size [
	| low upp mean stdDev r |
	"TODO generate a new method to creatte random values with normal distribution"
	low := 0.
	upp := 100.
	mean := (low + upp) / 2.
	stdDev := (upp - low)/4.
	r := Random new.
	r seed: 44.
	
	^ ((1 to: size ) collectWithIndex: [ :i :index | 
		| val sign rval |
		rval := r rsNext:0-mean and: upp + mean.
		val := self normal: rval mean: mean stdDev: stdDev.
		sign := index < (size / 2) ifTrue: [ -1 ] ifFalse: [ 1 ].
		
		loc +(size * val * sign)
		 ]) shuffled.
]
