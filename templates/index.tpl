<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
		<title>XC Planner</title>
		<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key={$GOOGLE_MAPS_API_KEY}" type="text/javascript"></script>
		<script src="js/jscoord-1.1.1.js" type="text/javascript"></script>
		<script src="js/mapiconmaker.js" type="text/javascript"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/prototype/1.6.0.3/prototype.js" type="text/javascript"></script>
		<script src="js/xcplanner.js" type="text/javascript"></script>
	</head>
	<body onload="XCLoad()" onunload="XCUnload()">
		<table>
			<tr>
				<td rowspan="2" valign="top" width="280px">
					<p>
						<span id="distance" style="font-size: 36px;">0.0km</span><br/>
						<span id="description">Open distance</span> (&times;<span id="multiplier">1.0</span>)<br/>
						<span id="score" style="font-size: 24px;">0.0 points</span>
					</p>
					<p>
						<b>Route:</b>
						<span onclick="XCRotateRoute(1); XCUpdateRoute();">&#8631;</span>
						<span onclick="XCReverseRoute(); XCUpdateRoute();">&#8644;</span>
						<span onclick="XCRotateRoute(-1); XCUpdateRoute();">&#8630;</span><br/>
						<span id="route"></span>
					</p>
					<p>
						<b>Turnpoints:</b><br/>
						<span id="turnpoints"></span><br>
						<select id="coordFormat" onchange="XCUpdateRoute();">
							<option value="utm" selected=on">UTM</option>
							<option value="d">dd.ddddd&deg;</option>
							<option value="dm">dd&deg; mm.mmm&prime;</option>
							<option value="dms">dd&deg; mm&prime; ss&Prime;</option>
							<option value="os">OS grid</option>
						</select>
						<a href="#" id="download">download</a>
					</p>

					<!-- <p>
						<b>Instructions:</b><br/>
						<span style="font-size: 12px">
						Go to your flying area by typing the name of the nearest town above and clicking Go!
						Choose the type of flight you want to plan using the drop-down menu.
						Drag the markers around to choose your turnpoints.
						Press the "Put turnpoints here" button to put the turnpoints on the area of the map that you are looking at.</span>
					</p> -->
					<p>
						<span style="font-size: 12px">Internet Explorer not supported, <a href="http://www.mozilla.com/">Download Firefox</a> instead!</span>
					</p>
					<p>
						<span style="font-size: 12px">Copyright &copy; Tom Payne, <a href="mailto:twpayne@gmail.com">twpayne@gmail.com</a>, 2009</span>
					</p>
					<p>
						<span style="font-size: 12px">Source code is GPL-3 <a href="http://github.com/twpayne/xcplanner">here</a>, contributions welcome! Thanks to Alex Graf for the FAI sectors and to Jonty Lawson for the GPX download.</span>
					</p>
				</td>
				<td>
					<form action="#" onsubmit="return false;">
						<input id="location" type="text" value="Doussard, France" />
						<input value="Go!" type="submit" onclick="XCGoto();" />
						<select id="flightType" onchange="XCUpdateFlightType(); XCUpdateRoute();">
							<optgroup label="Leonardo">
								<option value="leonardo,2,,">Open distance</option>
								<option value="leonardo,3,,">Open distance via one turnpoint</option>
								<option value="leonardo,4,,">Open distance via two turnpoints</option>
								<option value="leonardo,5,,">Open distance via three turnpoints</option>
								<option selected="true" value="leonardo,3,circuit,">Flat or FAI triangle</option>
							</optgroup>
							<optgroup label="Coupe Fédérale de Distance">
								<option value="cfd,2,,">Distance libre sans point de contournement</option>
								<option value="cfd,3,,">Distance libre via un point de contournement</option>
								<option value="cfd,4,,">Distance libre via deux points de contournement</option>
								<option value="cfd,2,circuit,">Aller-retour</option>
								<option value="cfd,3,circuit,">Triangle plat ou FAI</option>
								<option value="cfd,4,circuit,">Quadrilatère</option>
							</optgroup>
							<optgroup label="UK National XC League">
								<option value="ukxcl-national,2,,">Open distance</option>
								<option value="ukxcl-national,3,,">Turnpoint flight via one turnpoint</option>
								<option value="ukxcl-national,4,,">Turnpoint flight via two turnpoints</option>
								<option value="ukxcl-national,5,,">Turnpoint flight via three turnpoints</option>
								<option value="ukxcl-national,2,circuit,">Out and return</option>
								<option value="ukxcl-national,3,circuit,">Flat or FAI triangle</option>
								<option value="ukxcl-national,2,,declared">Flight to goal</option>
								<option value="ukxcl-national,2,circuit,declared">Declared out and return</option>
								<option value="ukxcl-national,3,circuit,declared">Declared FAI triangle</option>
							</optgroup>
							<optgroup label="XContest">
								<option value="xcontest,2,,">Free flight</option>
								<option value="xcontest,3,,">Free flight via a turnpoint</option>
								<option value="xcontest,4,,">Free flight via two turnpoints</option>
								<option value="xcontest,5,,">Free flight via three turnpoints</option>
								<option value="xcontest,3,circuit,">Flat or FAI triangle </option>
							</optgroup>
						</select>
						<input value="Put turnpoints here" type="submit" onclick="XCResetTurnpoints(); XCUpdateRoute();" />
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<div id="map" style="width: 800px; height: 600px"></div>
				</td>
			</tr>
		</table>
	</body>
</html>
