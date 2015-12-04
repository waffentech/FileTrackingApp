<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"	src="html5-boilerplate/js/vendor/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
<script type="text/javascript"	src="html5-boilerplate/js/vendor/Chart.js"></script>
<title>View My Files</title>
</head>
<body>
	<%@include file="header.jsp"%>
		<div class="container">
		<div class="row text-center">
			<h1>Dashboard</h1>
<!-- 				<a class="button">Change Date Range</a> -->
		</div>
		<div class="row">
			<div class="panel-group">
				<div class="col-md-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="text-center">File Status Chart </h3>
							<h6 class="text-center">(No. of files in New/Sent/Received/Closed Status)</h6>
							<p>
								<a href="" class="button">Filter By Employee</a>
							</p>
							<p>
								<a href="" class="button">Clear Filter</a>
							</p>
						</div>
						<div class="canvas-container panel-body">
							<canvas id="hours"></canvas>
							<div class="chart-legend">
								<ul>
									<li class="ship">New</li>
									<li class="rework">Sent</li>
									<li class="admin">Received</li>
									<li class="prod">Closed</li>
								</ul>
							</div>
						</div>

					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-default">
						<div class="chart-legend panel-heading">
							<h3 class="text-center">Trend Chart</h3>
								<h6 class="text-center">(Trend over the last 3 months)</h6>
							<p>
								<a href="" class="button">Change Date Range</a>
							</p>
							<p>
								<a href="" class="button">Filter by Employee</a>
							</p>
						</div>
						<div class="canvas-container panel-body">
							<canvas id="shipments"></canvas>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-default">
						<div class="chart-legend panel-heading">
							<h3 class="text-center">Files Distribution</h3>
							<h6 class="text-center">(No. of files with each Employee)</h6>
							<p>
								<a href="" class="button">Filter by Section</a>
							</p>
							<p>
								<a href="" class="button">Clear Filter</a>
							</p>
						</div>
						<div class="canvas-container panel-body">
							<canvas id="departments"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="panel-group">
				<div class="col-md-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="text-center">Files Assigned Currently</h3>
							<h6 class="text-center">(No. of files with each employee)</h6>
							<p>
								<a href="" class="button">Filter by Section</a>
							</p>
							<p>
								<a href="" class="button">Clear Filter</a>
							</p>
						</div>
						<div class="canvas-container panel-body">
							<canvas id="filesassigned"></canvas>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="text-center">Files Incoming</h3>
							<h6 class="text-center">(No. of incoming files to each employee)</h6>
							<p>
								<a href="" class="button">Filter by Section</a>
							</p>
							<p>
								<a href="" class="button">Clear Filter</a>
							</p>
						</div>
						<div class="canvas-container panel-body">
							<canvas id="filesinbound"></canvas>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="text-center">Files Outgoing</h3>
							<h6 class="text-center">(No. of outgoing files from each employee)</h6>
							<p>
								<a href="" class="button">Filter by Section</a>
							</p>
							<p>
								<a href="" class="button">Clear Filter</a>
							</p>
						</div>
						<div class="canvas-container panel-body">
							<canvas id="filesoutbound"></canvas>
<!-- 							<div id="js-legend" class="chart-legend"></div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>
<script>
	var data = [ {
		value : 20,
		color : "#637b85"
	}, {
		value : 30,
		color : "#2c9c69"
	}, {
		value : 40,
		color : "#dbba34"
	}, {
		value : 10,
		color : "#c62f29"
	}

	];
	var canvas = document.getElementById("hours");
	var ctx = canvas.getContext("2d");
	new Chart(ctx).Doughnut(data);

	var data = {
		labels : [ "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" ],
		datasets : [ {
			fillColor : "rgba(99,123,133,0.4)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
			data : [ 65, 54, 30, 81, 56, 55, 40 ]
		}, {
			fillColor : "rgba(219,186,52,0.4)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
			data : [ 20, 60, 42, 58, 31, 21, 50 ]
		}, ]
	}
	var canvas = document.getElementById("shipments");
	var ctx = canvas.getContext("2d");
	new Chart(ctx).Line(data);

	var data = {
		labels : [ "Ajay Kumar", "Vishal", "Rajesh Negi", "Shivakumar Shetty", "Harish", "Suraj" ],
		datasets : [ {
			fillColor : "rgba(220,220,220,0.5)",
			strokeColor : "#637b85",
			pointColor : "#dbba34",
			pointStrokeColor : "#637b85",
			data : [ 65, 59, 90, 81, 30, 56 ]
		} ]
	}
	var canvas = document.getElementById("departments");
	var ctx = canvas.getContext("2d");
	new Chart(ctx).Radar(data);

	var data = {
		    labels: ["Ramesh", "Suresh Kumar", "Neel Shetty", "Sunil Das", "Pankaj Kapoor", "Lokesh", "Amarnath"],
		    datasets: [
		        {
		            label: "Assigned Files",
		            fillColor: "rgba(151,187,205,0.5)",
		            strokeColor: "rgba(151,187,205,0.8)",
		            highlightFill: "rgba(151,187,205,0.75)",
		            highlightStroke: "rgba(151,187,205,1)",
		            data: [65, 59, 80, 81, 56, 55, 40]
		        }
		    ]
		};
	var canvas = document.getElementById("filesassigned");
	var ctx = canvas.getContext("2d");
	new Chart(ctx).Bar(data, {
		scaleShowVerticalLines: true,
		scaleShowHorizontalLines: true
   });

	var data = {
		    labels: ["Ramesh", "Suresh Kumar", "Neel Shetty", "Sunil Das", "Pankaj Kapoor", "Lokesh", "Amarnath"],
		    datasets: [
		        {
		            label: "Inbound Files",
		            fillColor: "rgba(151,187,205,0.5)",
		            strokeColor: "rgba(151,187,205,0.8)",
		            highlightFill: "rgba(151,187,205,0.75)",
		            highlightStroke: "rgba(151,187,205,1)",
		            data: [28, 48, 40, 19, 86, 27, 90]
		        }
		    ]
		};
	var canvas = document.getElementById("filesinbound");
	var ctx = canvas.getContext("2d");
	new Chart(ctx).Bar(data, {
		scaleShowVerticalLines: true,
		scaleShowHorizontalLines: true
   });
	var data = {
		    labels: ["Ramesh", "Suresh Kumar", "Neel Shetty", "Sunil Das", "Pankaj Kapoor", "Lokesh", "Amarnath"],
		    datasets: [
		        {
		            label: "Outbound Files",
		            fillColor: "rgba(151,187,205,0.5)",
		            strokeColor: "rgba(151,187,205,0.8)",
		            highlightFill: "rgba(151,187,205,0.75)",
		            highlightStroke: "rgba(151,187,205,1)",
 		            data: [28, 48, 40, 19, 86, 27, 90]
		        }
		    ]
		};
	var canvas = document.getElementById("filesoutbound");
	var ctx = canvas.getContext("2d");
	var myChart = new Chart(ctx).Bar(data, {
		scaleShowVerticalLines: true,
		scaleShowHorizontalLines: true
   });
// 	document.getElementById("js-legend").innerHTML = myChart.generateLegend();
	(function() {
		// set up the timeout variable
		var t;
		// setup the sizing function,
		// with an argument that tells the chart to animate or not
		function size(animate) {
			// If we are resizing, we don't want the charts drawing on every resize event.
			// This clears the timeout so that we only run the sizing function
			// when we are done resizing the window
			clearTimeout(t);
			// This will reset the timeout right after clearing it.
			t = setTimeout(function() {
				$("canvas").each(function(i, el) {
					// Set the canvas element's height and width to it's parent's height and width.
					// The parent element is the div.canvas-container
					$(el).attr({
						"width" : $(el).parent().width(),
						"height" : $(el).parent().outerHeight()
					});
				});
				// kickoff the redraw function, which builds all of the charts.
				redraw(animate);

				// loop through the widgets and find the tallest one, and set all of them to that height.
				var m = 0;
				// we have to remove any inline height setting first so that we get the automatic height.
				$(".widget").height("");
				$(".widget").each(function(i, el) {
					m = Math.max(m, $(el).height());
				});
				$(".widget").height(m);

			}, 100); // the timeout should run after 100 milliseconds
		}
		$(window).on('resize', size);
		function redraw(animation) {
			var options = {};
			if (!animation) {
				options.animation = false;
			} else {
				options.animation = true;
			}
			// ....
			// the rest of our chart drawing will happen here
			// ....
		}
		size(); // this kicks off the first drawing; note that the fi
	})
</script>
<style type="text/css">
/* .chart-legend ul { 
 	list-style: none; 
 	width: 100%; 
 	margin: 30px auto 0; 
 } */

 .chart-legend li { 
  	text-indent: 16px; 
 	line-height: 24px; 
 	position: relative; 
 	font-weight: 200; 
 	display: block; 
 	float: left; 
 	width: 50%; 
 	font-size: 0.8em; 
 } 

 .chart-legend  li:before { 
 	display: block; 
 	width: 10px; 
 	height: 16px; 
 	position: absolute; 
 	left: 0; 
 	top: 3px; 
 	content: ""; 
 } 

.ship:before {
	background-color: #637b85;
}

.rework:before {
	background-color: #2c9c69;
}

.admin:before {
	background-color: #dbba34;
}

.prod:before {
	background-color: #c62f29;
}

</style>
</html>