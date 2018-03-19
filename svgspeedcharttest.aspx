<%@ Page Language="C#" AutoEventWireup="true" CodeFile="svgspeedcharttest.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>svg performance test</title>
	<script>
		var source = new EventSource("data.ashx");
		source.onmessage = function (e) {
			update(JSON.parse(e.data));
		}
		function update(data) {	
			var lab = document.getElementById('label');
			var svg = document.getElementById('svg');
			var h = svg.clientHeight;
			var w = svg.clientWidth;

			for (var line = 0; line < 9; line++) {
				var polyline = document.getElementById('polyline' + (line + 1));
				var pts = polyline.points;
				var maxlength = 5000;
				var addpertime = data.length;
				var excess = pts.length + addpertime - maxlength;
				while (excess-- > 0) {
					pts.removeItem(0);
				}
				for (var i = 0; i < addpertime; i++) {
					var point = svg.createSVGPoint();
					point.x = 1;
					var y = data[i].y1;
					if (line == 1) { y = data[i].y2; }
					else if (line == 2) { y = data[i].y3; }
					else if (line == 3) { y = data[i].y4; }
					else if (line == 4) { y = data[i].y5; }
					else if (line == 5) { y = data[i].y6; }
					else if (line == 6) { y = data[i].y7; }
					else if (line == 7) { y = data[i].y8; }
					else if (line == 8) { y = data[i].y9; }

					point.y = ((line) / 10 + 0.1 * y) * h;
					pts.appendItem(point);
				}
				for (var i = 0; i < pts.length; i++) {
					pts[i].x = w * i / (pts.length - 1);
				}
				lab.textContent = "Points loaded: " + pts.length;
			}
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<b id="label"></b>
		<br />
		<svg id="svg" width="1000" height="600" style="width:1000px; height:600px; border: 1px solid #000000;">
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
