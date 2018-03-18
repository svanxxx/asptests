<%@ Page Language="C#" AutoEventWireup="true" CodeFile="svgspeedcharttest.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>svg performance test</title>
	<script>
		function timer(pindex) {
			var svg = document.getElementById('svg');
			var h = svg.clientHeight;
			var w = svg.clientWidth;

			var polyline = document.getElementById('polyline' + pindex);
			var pts = polyline.points;
			var maxlength = 5000;
			var addpertime = 100;
			var excess = pts.length + addpertime - maxlength;
			while (excess-- > 0) {
				pts.removeItem(0);
			}
			for (var i = 0; i < addpertime; i++) {
				var point = svg.createSVGPoint();
				point.x = 1;
				point.y = ((pindex - 1) / 10 + 0.1 * Math.random()) * h;
				pts.appendItem(point);
			}
			for (var i = 0; i < pts.length; i++) {
				pts[i].x = w * i / (pts.length - 1);
			}
			var lab = document.getElementById('label');
			lab.textContent = "Number of points: " + pts.length + " updated each 0.25 sec.";
		}
		setInterval(function () { for (var i = 1; i <= 9; i++) { timer(i) } }, 250);
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<b id="label"></b>
		<br />
		<svg id="svg" width="1000" height="600" style="border: 1px solid #000000;">
			<polyline id="polyline1" points="" style="fill: none; stroke: black; stroke-width: 1" />
			<polyline id="polyline2" points="" style="fill: none; stroke: red; stroke-width: 1" />
			<polyline id="polyline3" points="" style="fill: none; stroke: green; stroke-width: 1" />
			<polyline id="polyline4" points="" style="fill: none; stroke: blue; stroke-width: 1" />
			<polyline id="polyline5" points="" style="fill: none; stroke: yellow; stroke-width: 1" />
			<polyline id="polyline6" points="" style="fill: none; stroke: darkred; stroke-width: 1" />
			<polyline id="polyline7" points="" style="fill: none; stroke: pink; stroke-width: 1" />
			<polyline id="polyline8" points="" style="fill: none; stroke: lightpink; stroke-width: 1" />
			<polyline id="polyline9" points="" style="fill: none; stroke: gray; stroke-width: 1" />
		</svg>
	</form>
</body>
</html>
