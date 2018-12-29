<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" type="text/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
<xsl:template match="/Hole">

<html>
  <head>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  <title><xsl:value-of select="HoleId"/></title>
  <link rel="stylesheet" type="text/css" href="styles/ags_format.css" />
  <script type="text/javascript" src="scripts/ags_java.js"></script>
  </head>
  <body>
  <h2>Ground Investigation Data for Hole  
				<xsl:element name="a">
					<xsl:attribute name="href">
						http://www.google.com/maps/place/
						<xsl:value-of select="GintCoordinateLatitude"/>,
						<xsl:value-of select="GintCoordinateLongitude"/>
					</xsl:attribute>
						<xsl:value-of select="HoleId"/>
				</xsl:element>
	<div style="position: absolute; top:0px; left:1100px; width:600px; height:25px">
<img width="200" height="50" alt="logo" src="images/AECOM_GroundEngineeringDataPortal.png"/>
</div>
  </h2>
  <table>
  <th><h2><a onclick="toggleVisible('holeInformation')">holeInformation</a></h2></th>
  <th><h2><a onclick="toggleVisible('laboratoryTesting')">laboratoryTesting</a></h2></th>
  <th><h2><a onclick="toggleVisible('monitoring')">monitoring</a></h2></th> 
  <th><h2><a onclick="toggleVisible('fieldTesting')">fieldTesting</a></h2></th>
  <th><h2><a onclick="toggleVisible('groundInformation')">groundInformation</a></h2></th>
  </table>
  
		<div id="holeInformation">
		<h2>holeInformation</h2>
		<xsl:call-template name="Hole"/>
		<xsl:call-template name="holeInformation"/>
		</div>
 
		<div id="laboratoryTesting">
		<xsl:call-template name="laboratoryTesting"/>
		</div>
		
		<div id="monitoring">
		<xsl:call-template name="monitoring"/>
		</div>
		
		<div id="fieldTesting"> 
		<xsl:call-template name="fieldTesting"/>
		</div>
		
		<div id="groundInformation">
		<xsl:call-template name="groundInformation"/>
		</div>
  
  
  </body>
  </html>
</xsl:template>


<xsl:template name="Hole">
<h3>Hole Information (Hole)</h3>
		<table id="Hole">
		<th>Location identifier ()</th>
		<th>type of activity ()</th>
		<th>Status of information relating to this position ()</th>
		<th>National Grid Location Easting (m)</th>
		<th>National Grid Location Northing (m)</th>
		<th>National grid referencing system used (m)</th>
		<th>Ground Level (m)</th>
		<th>Remarks ()</th>
		<th>Final depth (m)</th>
		<th>Started Date (dd/mmm/yyyy)</th>
		<th>Purpose of activity at this location ()</th>
		<th>Reason for activity termination ()</th>
		<th>Ended Date (dd/mm/yyyy)</th>
		<th>OSGB letter grid reference ()</th>
		<th>Local grid x co-ordinate (m)</th>
		<th>Local grid y co-ordinate (m)</th>
		<th>Local grid z co-ordinate (m)</th>
		<th>Local datum referencing system used ()</th>
		<th>Local grid referencing system used ()</th>
		<th>National Grid Easting of end of traverse (m)</th>
		<th>National Grid Northing of end of traverse (m)</th>
		<th>Ground level relative to datum of end of traverse (m)</th>
		<th>Local grid easting of end of traverse (m)</th>
		<th>Local grid northing of end of traverse (m)</th>
		<th>Local elevation of end of traverse (m)</th>
		<th>Latitude (deg(decimal))</th>
		<th>Longitude (deg(decimal))</th>
		<th>Latitude of end of traverse (m)</th>
		<th>Longitude of end of traverse ()</th>
		<th>Projection Format ()</th>
		<th>Method of Location ()</th>
		<th>Location sub division within project ()</th>
		<th>Hole cluster reference number ()</th>
		<th>Alignment Identifier ()</th>
		<th>Offset of hole from assigned alignment (m)</th>
		<th>Chainage of hole on assigned alignment (m)</th>
		<th>Reference to or details of algorithm used to calculate local grid reference, local ground levels or chainage ()</th>
		<th>Associated file reference ()</th>
		<th>National Datum Referencing System used ()</th>
		<th>Original Hole Id ()</th>
		<th>Original Job Reference ()</th>
		<th>Originating Company ()</th>
		
		<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="HoleType"/></td>
		<td><xsl:value-of select="HoleStat"/></td>
		<td><xsl:value-of select="HoleNatE"/></td>
		<td><xsl:value-of select="HoleNatN"/></td>
		<td><xsl:value-of select="HoleGref"/></td>
		<td><xsl:value-of select="HoleGL"/></td>
		<td>
 			<xsl:if test="string-length(HoleRem) &gt; 12">
			<xsl:value-of select="concat(substring(HoleRem,1,12),'...')"/>
			</xsl:if>
		 	<xsl:if test="string-length(HoleRem) &lt; 13">
			<xsl:value-of select="HoleRem"/>
			</xsl:if> 
		</td>
		<td><xsl:value-of select="HoleFDep"/></td>
		<td><xsl:value-of select="HoleStar"/></td>
		<td><xsl:value-of select="HolePurp"/></td>
		<td><xsl:value-of select="HoleTerm"/></td>
		<td><xsl:value-of select="HoleEndD"/></td>
		<td><xsl:value-of select="HoleLett"/></td>
		<td><xsl:value-of select="HoleLocX"/></td>
		<td><xsl:value-of select="HoleLocY"/></td>
		<td><xsl:value-of select="HoleLocZ"/></td>
		<td><xsl:value-of select="HoleDatm"/></td>
		<td><xsl:value-of select="HoleLRef"/></td>
		<td><xsl:value-of select="HoleEtrv"/></td>
		<td><xsl:value-of select="HoleNtrv"/></td>
		<td><xsl:value-of select="HoleLtrv"/></td>
		<td><xsl:value-of select="HoleXtrl"/></td>
		<td><xsl:value-of select="HoleYtrl"/></td>
		<td><xsl:value-of select="HoleZtrl"/></td>
		<td><xsl:value-of select="HoleLat"/></td>
		<td><xsl:value-of select="HoleLong"/></td>
		<td><xsl:value-of select="HoleElat"/></td>
		<td><xsl:value-of select="HoleElon"/></td>
		<td><xsl:value-of select="HoleLlz"/></td>
		<td><xsl:value-of select="HoleLocm"/></td>
		<td><xsl:value-of select="HoleLoca"/></td>
		<td><xsl:value-of select="HoleClst"/></td>
		<td><xsl:value-of select="HoleAlID"/></td>
		<td><xsl:value-of select="HoleOffs"/></td>
		<td><xsl:value-of select="HoleCnge"/></td>
		<td><xsl:value-of select="HoleTran"/></td>
		<td><xsl:value-of select="FileFset"/></td>
		<td><xsl:value-of select="HoleNatD"/></td>
		<td><xsl:value-of select="HoleOrid"/></td>
		<td><xsl:value-of select="HoleOrJo"/></td>
		<td><xsl:value-of select="HoleOrCo"/></td>
		</tr>
		
		<xsl:if test="string-length(HoleRem) &gt; 12">
		<tr>
		<td>*Remarks(cont)</td><td colspan="12" ><xsl:value-of select="HoleRem"/></td>
		</tr>
		</xsl:if>
		</table>
</xsl:template>

<xsl:template name="holeInformation">

<h3>Project Information (Proj)</h3>
	<xsl:if test="count(Proj)>0">
		<table id="Proj">
		<th>project identifier ()</th>
		<th> ()</th>
		<th>project identifier ()</th>
		<th>project title ()</th>
		<th>Client name ()</th>
		<th>Contractor name ()</th>
		<th>Project Engineer ()</th>
		<th>General project comments ()</th>
		<th>Project Datum ()</th>
		<th> ()</th>
		<th>Project Coordinate System ()</th>
		<th>File Set ()</th>
		<th>Location of project ()</th>
		<xsl:apply-templates  select="Proj" />
		</table>
	</xsl:if>

<h3>Backfill details (Bkfl)</h3>
	<xsl:if test="count(Bkfl)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Depth to the top of section (m)</th>
		<th>Depth to the base of section ()</th>
		<th>Backfill description ()</th>
		<th>Backfill Legend code ()</th>
		<th>Date of backfill ()</th>
		<th>Backfill Remarks (m)</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Bkfl" />
		</table>
	</xsl:if>

<h3>Casing diameter by depth (Cdia)</h3>
	<xsl:if test="count(Cdia)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Depth achieved at CDIA_HOLE (m)</th>
		<th>Casing diameter (mm)</th>
		<th>Remarks ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Cdia" />
		</table>
	</xsl:if>
	
<h3>Chiselling details (Chis)</h3>
	<xsl:if test="count(Chis)>0">
		<table>
		<th>Location identifier ()</th>
		<th>depth at start of chiselling (m)</th>
		<th>depth at end of chiselling (m)</th>
		<th>Time taken (hhmm)</th>
		<th>Start time (yyyy-mm-ddThh:mm)</th>
		<th>Chiselling tool used ()</th>
		<th>Remarks ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Chis" />
		</table>
	</xsl:if>	
	
<h3>Chain of Custody Information (Choc)</h3>
	<xsl:if test="count(Choc)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Depth to the TOP of sample (m)</th>
		<th>Sample Reference number ()</th>
		<th>Sample type ()</th>
		<th>Sample unique global identifier ()</th>
		<th>Chain of custody reference (m)</th>
		<th>Samples despatched from ()</th>
		<th>Samples despatched to ()</th>
		<th>Date dispatched (yyyy-mm-dd)</th>
		<th>Batch reference ()</th>
		<th>Remarks ()</th>
		<th>Weight percent of material retained on 10mm sieve (%)</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Choc" />
		</table>
	</xsl:if>
	
<h3>Drilling/Advancement Observations and Parameters (Dobs) </h3>
	<xsl:if test="count(Dobs)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Depth to top of reported section (m)</th>
		<th>Depth to base of reported section (m)</th>
		<th>Readings set reference ()</th>
		<th>Duration to advance reported section (hhmm)</th>
		<th>Date and time of start of reported section (yyyy-mm-ddThh:mm:ss)</th>
		<th>Date and time of end of reported section (yyyy-mm-ddThh:mm:ss)</th>
		<th>Drill head rotation torque (Nm)</th>
		<th>Drill head rotation speed (rpm)</th>
		<th>Penetration rate (m/hr)</th>
		<th>Hammering used during section (Y/N)</th>
		<th>Pressure of downthrust system (bar)</th>
		<th>Pressure of restraining (holdback) system (bar)</th>
		<th>Torque pressure (bar)</th>
		<th>Torque applied to top of drill rods (Nm)</th>
		<th>Downward thrust on bit (kN)</th>
		<th>Restraining (holdback) force (Nm)</th>
		<th>Supply pressure to downhole hammer (bar)</th>
		<th>Specific Energy (Mj/m3)</th>
		<th>Flushing medium pressure at the output of the pump over flush zone (kPa)</th>
		<th>Flushing medium circulation rate (input) over flush zone (l/min)</th>
		<th>Flushing medium recovery rate over flush zone (l/min)</th>
		<th>Remarks ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Dobs" />
		</table>
	</xsl:if>
	
<h3>Drilling Information (Drem) </h3>
	<xsl:if test="count(Drem)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Depth of DREM_REM (m)</th>
		<th>Base depth (m)</th>
		<th>General remarks ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Drem" />
		</table>
	</xsl:if>		

<h3>Rotary Core Flush Details (Flsh) </h3>
	<xsl:if test="count(Flsh)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Depth to top of flush zone (m)</th>
		<th>Depth to bottom of flush zone (m)</th>
		<th>Type of flush ()</th>
		<th>Flush Return (%)</th>
		<th>Flush Return maximum (as percentage) (%)</th>
		<th>Colour of flush return ()</th>
		<th>Remarks on test ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Flsh" />
		</table>
	</xsl:if>	

<h3>Hole diameter by depth (Hdia)</h3>
	<xsl:if test="count(Hdia)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Depth of base of hole at the diameter recorded in HDIA_DIAM (m)</th>
		<th>Casing diameter (mm)</th>
		<th>Remarks ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Hdia" />
		</table>
	</xsl:if>	

<h3>Depth related hole information (Hdph)</h3>
	<xsl:if test="count(Hdph)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Depth to TOP of section (m)</th>
		<th>Depth to BASE of section (m)</th>
		<th>Type of depth ()</th>
		<th>Date and time of start of section (yyyy-mm-ddThh:mm)</th>
		<th>Date and time of end of section (yyyy-mm-ddThh:mm)</th>
		<th>Name of crew ()</th>
		<th>Plant used ()</th>
		<th>Shoring/Support used ()</th>
		<th>Stability of trial pit / trial trench or logged traverse length ()</th>
		<th>Trial pit / trial trench or logged traverse length (m)</th>
		<th>Trial pit / trial trench or logged traverse width (m)</th>
		<th>Drill bit used ()</th>
		<th>Bit Condition ()</th>
		<th>Barrel type ()</th>
		<th>Barrel length (m)</th>
		<th>The definitive person responsible for logging the section ()</th>
		<th>Start date of hole section logging (yyyy-mm-dd)</th>
		<th>Rotary Remarks ()</th>
		<th>Details of weather and environmental conditions during hole section construction ()</th>
		<th>Details of method of hole section construction ()</th>
		<th>Drilling Contractor ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Hdph" />
		</table>
	</xsl:if>
<h3>Hole progress by time (Ptim)</h3>
	<xsl:if test="count(Ptim)>0">
		<table>
		<th>Exploratory hole or location equivalent ()</th>
		<th>Date of reading (dd/mm/yyyy)</th>
		<th>Time of reading (hr:mm:ss)</th>
		<th>Hole depth at PTIM_TIME (m)</th>
		<th>Depth of casing at PTIM_TIME (m)</th>
		<th>Depth to water at PTIM_TIME (m)</th>
		<th>Remarks at PTIM_TIME ()</th>
		<xsl:apply-templates select="Ptim" />
		</table>
	</xsl:if>

<h3>Monitoring Installation Pipe Work (Pipe)</h3>
	<xsl:if test="count(Pipe)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Pipe reference ()</th>
		<th>Top of construction zone (m)</th>
		<th>Base of construction zone (m)</th>
		<th>Type of pipe (mm)</th>
		<th>Type of pipe ()</th>
		<th>Remarks ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Pipe" />
		</table>
	</xsl:if>
	
<h3>Water Added Records (Wadd)</h3>
	<xsl:if test="count(Wadd)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Depth to top of reported section (m)</th>
		<th>Depth to base of reported section (m)</th>
		<th>Amount of water added (l)</th>
		<th>Boring/drilling method associated with addition of water (HDPH_TYPE abbreviation) ()</th>
		<th>Remarks related to addition of water requirements, method ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Wadd" />
		</table>
	</xsl:if>

<h3>Window or Windowless Sampling Run Details (Wins)</h3>
	<xsl:if test="count(Wins)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Top of sampling run (m)</th>
		<th>Base of sampling run ()</th>
		<th>Internal diameter of sampler (mm)</th>
		<th>Duration of sampling run (hh:mm:ss)</th>
		<th>Sample recovery (%)</th>
		<th>Remarks on test ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Wins" />
		</table>
	</xsl:if>	
</xsl:template>

<xsl:template name="laboratoryTesting">

<h2>laboratoryTesting</h2>

<h3>Aggregate Abrasion Tests(Aavt)</h3>
	<xsl:if test="count(Aavt)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Depth to the TOP of sample (m)</th>
		<th>Sample Reference number ()</th>
		<th>Sample type ()</th>
		<th>Sample unique global identifier ()</th>
		<th>Specimen reference number ()</th>
		<th>Specimen depth (m)</th>
		<th>Specimen description ()</th>
		<th>Details of specimen preparation including time between preparation and testing ()</th>
		<th>Aggregate Abrasion Value ()</th>
		<th>Remarks on test ()</th>
		<th>Test method ()</th>
		<th>Client/laboratory preferred name of determinand ()</th>
		<th>Accrediting body and reference number (when appropriate) ()</th>
		<th>Test Status ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Aavt" />
		</table>
	</xsl:if>

<h3>Aggregate Crushing Value Tests (Acvt)</h3>
	<xsl:if test="count(Acvt)>0">
		<table>
		<th>Location identifier ()</th>
		<th>Depth to the TOP of sample (m)</th>
		<th>Sample Reference number ()</th>
		<th>Sample type ()</th>
		<th>Sample unique global identifier ()</th>
		<th>Specimen reference number ()</th>
		<th>Specimen depth (m)</th>
		<th>Specimen description ()</th>
		<th>Details of specimen preparation including time between preparation and testing ()</th>
		<th>Aggregate Crushing Value (%)</th>
		<th>Size fraction from which test portion was obtained ()</th>
		<th>Remarks on test ()</th>
		<th>Test method ()</th>
		<th>Client/laboratory preferred name of determinand ()</th>
		<th>Accrediting body and reference number (when appropriate) ()</th>
		<th>Test Status ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates select="Acvt" />
		</table>
	</xsl:if>

<h3>Aggregate Elongation Index Tests (Aelo)</h3>
	<xsl:if test="count(Aelo)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Aggregate elongation index ()</th>
	<th>Remarks on test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Aelo" />
	</table>
	</xsl:if>
	
<h3>Aggregate Elongation Index Tests (Aflk)</h3>
	<xsl:if test="count(Aflk)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Aggregate flakiness index (%)</th>
	<th>Mass of test portion (kg)</th>
	<th>Remarks on test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Aflk" />
	</table>
	</xsl:if>

<h3>Aggregate Abrasion Tests (Aivt)</h3>
	<xsl:if test="count(Aivt)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Aggregate impact value test 1 (%)</th>
	<th>Aggregate impact value test 2 (%)</th>
	<th>Mean aggregate impact value (%)</th>
	<th>Size fraction from which test portion was obtained ()</th>
	<th>Particle density of size fraction between 8 mm and 12.5mm (Mg/m3)</th>
	<th>Remarks on test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Aivt" />
	</table>
	</xsl:if>
	
<h3>Los Angeles Abrasion Tests (Alos)</h3>
	<xsl:if test="count(Alos)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Los Angeles coefficient ()</th>
	<th>Los Angeles percentage wear (%)</th>
	<th>Los Angeles wear ratio (%)</th>
	<th>Size fraction from which test portion was obtained ()</th>
	<th>Ball load or charge grading ()</th>
	<th>Remarks on test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Alos" />
	</table>
	</xsl:if>
	
<h3>Aggregate Polished Stone Tests (Apsv)</h3>
	<xsl:if test="count(Apsv)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Aggregate polished stone value ()</th>
	<th>Remarks on test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Apsv" />
	</table>
	</xsl:if>

<h3>Aggregate Determination of the Resistance to Wear (micro-Deval) (Artw)</h3>
	<xsl:if test="count(Artw)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Size fraction on which sample obtained ()</th>
	<th>Type of test ()</th>
	<th>Micro-Deval coefficient for test specimen one ()</th>
	<th>Micro-Deval coefficient for test specimen two ()</th>
	<th>Mean Micro-Deval value (dry) ()</th>
	<th>Mean Micro-Deval value (wet) ()</th>
	<th>Date control 2 polished stone value first run (yyyy-mm-dd)</th>
	<th>Remarks on test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Artw" />
	</table>
	</xsl:if>

<h3>Slake Durability Index Tests (Asdi)</h3>
	<xsl:if test="count(Asdi)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>First cycle slake durability index (if ASDI_SDI1 or ASDI_SDI2 is between 0% and 10%) (%)</th>
	<th>Second cycle slake durability index (%)</th>
	<th>Nature and temperature of slaking fluid ()</th>
	<th>Appearance of fragments retained in the drum ()</th>
	<th>Appearance of fragments passing through the drum ()</th>
	<th>Remarks on test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Asdi" />
	</table>
	</xsl:if>

<h3>Aggregate Soundness Tests (Asns)</h3>
	<xsl:if test="count(Asns)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Aggregate soundness test result (%)</th>
	<th>Size fraction from which test portion was obtained paration and testing ()</th>
	<th>Remarks on test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Asns" />
	</table>
	</xsl:if>
	
<h3>Aggregate Water Absorption Tests (Awad)</h3>
	<xsl:if test="count(Awad)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Aggregate water absorption (%)</th>
	<th>Remarks on test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Awad" />
	</table>
	</xsl:if>

<h3>California Bearing Test General (Cbrg)</h3>
	<xsl:if test="count(Cbrg)>0">
	<table>
		<th>Location identifier ()</th>
		<th>Depth to the TOP of sample (m)</th>
		<th>Sample Reference number ()</th>
		<th>Sample type ()</th>
		<th>Sample unique global identifier ()</th>
		<th>Specimen reference number ()</th>
		<th>Specimen depth (m)</th>
		<th>Specimen description ()</th>
		<th>Details of specimen preparation including time between preparation and testing ()</th>
		<th>Sample Condition ()</th>
		<th>Method of remoulding ()</th>
		<th>Notes on CBR Test ()</th>
		<th>Natural moisture content (%)</th>
		<th>Initial moisture content (%)</th>
		<th>Weight percent retained on 20mm sieve (%)</th>
		<th>Amount of stabaliser added (%)</th>
		<th>Type of stabiliser added ()</th>
		<th>Remarks including commentary on effect of specimen disturbance on test result ()</th>
		<th>BS1377: Part 4: 1990 4.5kg compactive effort ()</th>
		<th>Name of testing laboratory/organisation ()</th>
		<th>Accrediting body and reference number (when appropriate) ()</th>
		<th>Test Status ()</th>
		<th>Associated file reference ()</th>
	<xsl:apply-templates select="Cbrg" />
	</table>
	</xsl:if>
	
<h3>California Bearing Test (Cbrt)</h3>
	<xsl:if test="count(Cbrg/cbrResults/Cbrt)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>CBR test number ()</th>
	<th>CBR at top (%)</th>
	<th>CBR at bottom (%)</th>
	<th>Moisture content at top (%)</th>
	<th>Moisture content at bottom (%)</th>
	<th>Initial moisture content (%)</th>
	<th>Bulk Density (Mg/m3)</th>
	<th>Dry density (%)</th>
	<th>Amount of swell recorded (mm)</th>
	<th>Details of soaking ()</th>
	<th>Amount of swell recorded (mm)</th>
	<th>Test specific remarks ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Cbrg/cbrResults/Cbrt" />
	</table>
	</xsl:if>
	
<h3>Compaction Tests General (Cmpg)</h3>
	<xsl:if test="count(Cmpg)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Test number (m)</th>
	<th>Details of specimen preparation including time between preparation and testing (m)</th>
	<th>Specimen description (m)</th>
	<th>Compaction test type ()</th>
	<th>Compaction mould type ()</th>
	<th>Weight percent of material on 37.5mm sieve (%staxtz)</th>
	<th>Weight percent of material on 20mm sieve (%)</th>
	<th>Particle density measured or assumed (Mg/m3)</th>
	<th>Maximum dry density (Mg/m3)</th>
	<th>Moisture content at maximum dry density (%)</th>
	<th>Amount of stabiliser added (%)</th>
	<th>Type of stabiliser added ()</th>
	<th>Remarks including commentary on effect of specimen disturbance on test result ()</th>
	<th>Remarks including commentary on effect of specimen disturbance on test result ()</th>
	<th>Name of testing laboratory/organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Cmpg" />
	</table>
	</xsl:if>	
	
<h3>Compactions Tests (Cmpt)</h3>
	<xsl:if test="count(Cmpg/cmpResults/Cmpt)>0">
	<table>
	<th>Exploratory hole or location equivalent ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Compaction point number ()</th>
	<th>Moisture content (%)</th>
	<th>Maximum dry density (Mg/m3)</th>
	<xsl:apply-templates select="Cmpg/cmpResults/Cmpt" />
	</table>
	</xsl:if>	

<h3>Consolidation Test - General (Cong)</h3>
	<xsl:if test="count(Cong)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Oedometer or Rowe, primary or secondary consolidation ()</th>
	<th>Sample condition ()</th>
	<th>Test specimen diameter (mm)</th>
	<th>Test specimen height (mm)</th>
	<th>Initial moisture content (%)</th>
	<th>Final moisture content (%)</th>
	<th>Initial bulk density (Mg/m3)</th>
	<th>Initial Dry Density (Mg/m3)</th>
	<th>Particle density (BS 1377) with # if assumed (Mg/m3)</th>
	<th>Initial degree of saturation (%)</th>
	<th>Swelling pressure (kN/m2)</th>
	<th>Height change of specimen on saturation as percentage of original height (%)</th>
	<th>Initial voids ratio ()</th>
	<th>Test details including method statement ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<th>Coefficient of volume compressibility ovre CONG_INCD (m2/MN)</th>
	<th>Defined stress range ()</th>
	<xsl:apply-templates select="Cong" />
	</table>
	</xsl:if>
	
<h3>Consolidation Test (Cons)</h3>
	<xsl:if test="count(Cons)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Oedometer stress increment number ()</th>
	<th>Initial voids ratio ()</th>
	<th>Stress at end of stress incremenet/decrement (kN/m2)</th>
	<th>Voids ratio at end of stress increment ()</th>
	<th>Reported coefficient of volume compressibility over stress increment (m2/MN)</th>
	<th>Coefficient of secondary compression over stress increment ()</th>
	<th>Coefficient of consolidation determined by the root time method ()</th>
	<th>Coefficient of consolidation determined by the log time method ()</th>
	<th>Average temperature over stress increment ()</th>
	<th>Remarks including method used to determine coefficients reported under CONS_INMV and selected CONS_INCV (from either of CONS_CVRT or CONS_CVLG) ()</th>
	<th>Associated file reference ()</th>
	<th>Compression Index ()</th>
	<th>Swelling Index ()</th>
	<th>Past overconsolidation pressure ()</th>
	<xsl:apply-templates select="Cong/conResult/Cons" />
	</table>
	</xsl:if>

<h3>Environmental Contaminant Testing (Eres)</h3>
	<xsl:if test="count(Eres)>0">
	<table>
		<th>Location identifier ()</th>
		<th>Depth to the TOP of sample (m)</th>
		<th>Sample Reference number ()</th>
		<th>Sample type ()</th>
		<th>Sample unique global identifier ()</th>
		<th>Specimen reference number ()</th>
		<th>Specimen depth (m)</th>
		<th>Chemical code ()</th>
		<th>Test method ()</th>
		<th>Laboratory test matrix ()</th>
		<th>Run type (Initial or Reanalysis) ()</th>
		<th>Test reference ()</th>
		<th>Chemical name ()</th>
		<th>Laboratory analytical test name ()</th>
		<th>Result value ()</th>
		<th>Result unit ()</th>
		<th>Reported result ()</th>
		<th>Result type ()</th>
		<th>Reportable result ()</th>
		<th>Detect flag ()</th>
		<th>Detect flag ()</th>
		<th>Intepreted qualifiers ()</th>
		<th>Laboratory qualifiers ()</th>
		<th>Reporting detection limit ()</th>
		<th>Method detection limit ()</th>
		<th>Qualification limit ()</th>
		<th>Unit of detection / qulaification limits ()</th>
		<th>Tentatively Identified Compound (TIC) probability (%)</th>
		<th>Tentatively Identified Compound (TIC) retention time (%)</th>
		<th>Sample receipt date at laboratory (yyyy-mm-dd)</th>
		<th>Sample delivery or batch code ()</th>
		<th>Details of specimen preparation including time between preparation and testing ()</th>
		<th>Specimen description ()</th>
		<th>Analysis date and time (yyyy-mm-ddThh:mm)</th>
		<th>Test Name as defined in LBST_TEST during electronic scheduling ()</th>
		<th>Total or dissolved ()</th>
		<th>Analysis location ()</th>
		<th>Basis ()</th>
		<th>Basis ()</th>
		<th>Leachate preparation method ()</th>
		<th>Leachate preparation date and time (yyyy-mm-ddThh:mm)</th>
		<th>Instrument Reference No or Identifier ()</th>
		<th>Size of material removed prior to test; value given indicates lowest sized material removed (mm)</th>
		<th>Percentage of material removed (%)</th>
		<th>Remarks on test ()</th>
		<th>Client/laboratory preferred name of determinand ()</th>
		<th>Accrediting body and reference number (when appropriate) ()</th>
		<th>Test Status ()</th>
		<th>Associated file reference ()</th>
	<xsl:apply-templates select="Eres" />
	</table>
	</xsl:if>

<h3>Effective Stress Consolidation Tests - General(Escg)</h3>
	<xsl:if test="count(Escg)>0">
	<table>
		<th>Location identifier ()</th>
		<th>Depth to the TOP of sample (m)</th>
		<th>Sample Reference number ()</th>
		<th>Sample type ()</th>
		<th>Sample unique global identifier ()</th>
		<th>Specimen reference number ()</th>
		<th>Specimen depth (m)</th>
		<th>Specimen description</th>
		<th>Details of specimen preparation including time between preparation and testing</th>
		<th>Test type</th>
		<th>Type of equipment used</th>
		<th>Sample condition</th>
		<th>Test specimen diameter</th>
		<th>Test specimen height</th>
		<th>Initial moisture content</th>
		<th>Final moisture content</th>
		<th>Initial bulk density</th>
		<th>Initial Dry Density</th>
		<th>Particle density (BS 1377) with # if assumed</th>
		<th>Initial voids ratio</th>
		<th>Initial degree of saturation</th>
		<th>Type of loading ( strain )</th>
		<th>Type of drainage</th>
		<th>Pore pressure measurement location</th>
		<th>Swelling pressure</th>
		<th>Method of saturation</th>
		<th>Saturation increments</th>
		<th>Differential pressure during saturation</th>
		<th>Cell or diaphragm pressure at end of saturation</th>
		<th>Back pressure at end of saturation</th>
		<th>B value at end of saturation</th>
		<th>Volume of water taken in during saturation</th>
		<th>Test details including method statement</th>
		<th>Test method</th>
		<th>Client/laboratory preferred name of determinand</th>
		<th>Accrediting body and reference number (when appropriate)</th>
		<th>Test Status</th>
		<th>Associated file reference</th>
	<xsl:apply-templates select="Escg" />
	</table>
	</xsl:if>

<h3>Effective Stress Consolidation Tests - Data (Esct)</h3>
	<xsl:if test="count(Escg/escResults/Esct)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Consolidation stage number ()</th>
	<th>Additional stage specific details ()</th>
	<th>Cell or diaphragm pressure applied during stage (kPa)</th>
	<th>Back pressure applied during stage (kPa)</th>
	<th>Pore pressure at end of undrained loading (kPa)</th>
	<th>Pore pressure at end of consolidation stage (kPa)</th>
	<th>Effective stress at end of consolidation stage (kPa)</th>
	<th>Voids ratio at start of increment ()</th>
	<th>Voids ratio at end of increment ()</th>
	<th>Percentage pore pressure dissipation at end of stage ()</th>
	<th>Settlement measured during consolidation stage ()</th>
	<th>Volume change measured during (ml)</th>
	<th>Reported coefficient of volume compressibility over stress increment (m2/MN)</th>
	<th>Reported coefficient of consolidation over stress increment (m2/yr)</th>
	<th>Reported coefficient of consolidation over stress increment ()</th>
	<th>Method used for deriving Cv ()</th>
	<th>Average temperature over stress increment (degC)</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Escg/escResults/Esct" />
	</table>
	</xsl:if>
	
<h3>Frost Susceptibility (Frst)</h3>
	<xsl:if test="count(Frst)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Sample condition ()</th>
	<th>Maximum dry density (Mg/m3)</th>
	<th>Moisture content (%)</th>
	<th>Frost heave, first specimen (%)</th>
	<th>Frost heave, second specimen (%)</th>
	<th>Frost heave, third specimen (%)</th>
	<th>Mean heave of 3 specimens (%)</th>
	<th>Amount of stabiliser added (%)</th>
	<th>Type of stabiliser added ()</th>
	<th>Notes on frost susceptibility ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Frst" />
	</table>
	</xsl:if>

<h3>Geotechnical Chemistry Testing (Gchm)</h3>
	<xsl:if test="count(Gchm)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Determinand ()</th>
	<th>Test method ()</th>
	<th>Test type ()</th>
	<th>Test result ()</th>
	<th>Test result units ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Remarks on test ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Gchm" />
	</table>
	</xsl:if>	

<h3>Particle Size Distribution Analysis General (Grag)</h3>
	<xsl:if test="count(Grad)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Uniformity coefficient D60/D10 ()</th>
	<th>Percentage of material tested greater than 63mm (cobbles) (%)</th>
	<th>Percentage of material tested in range 63mm to 2mm (gravel) (%)</th>
	<th>Percentage of material tested in range 2mm to 63um (sand) (%)</th>
	<th>Percentage of material tested in range 63um to 2um (silt) (%)</th>
	<th>Percentage of material than 2um (clay) (%)</th>
	<th>Percentage less than 63um (%)</th>
	<th>Remarks on test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Grag" />
	</table>
	</xsl:if>	
	
<h3>Particle Size Distribution Analysis Data (Grat)</h3>
	<xsl:if test="count(Grat)>0">
	<table>
		<th>Location identifier ()</th>
		<th>Depth to the TOP of sample (m)</th>
		<th>Sample Reference number ()</th>
		<th>Sample type ()</th>
		<th>Sample unique global identifier ()</th>
		<th>Specimen reference number ()</th>
		<th>Specimen depth (m)</th>
		<th>Sieve or particle size (mm)</th>
		<th>Percentage passing finer (%)</th>
		<th>Grade analysis test type ()</th>
		<th>Remarks on test ()</th>
		<th>Associated file reference ()</th>
	<xsl:apply-templates select="Grat" />
	</table>
	</xsl:if>	

<h3>Moisture Condition Value Test General (Mcvg)</h3>
	<xsl:if test="count(Mcvg)>0">
	<table Id="Mcvg">
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Weight percent of material retained on 20mm sieve (%)</th>
	<th>Natural moisture content (%)</th>
	<th>Amount of stabiliser added (%)</th>
	<th>Type of stabiliser added ()</th>
	<th>Notes on MCV test as BS 1377 Part 4 Cl 5.4, and 5.5 Test report items a) and c) ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Mcvg" />
	</table>
	</xsl:if>
	
<h3>Moisture Condition Value Test (Mcvt)</h3>
	<xsl:if test="count(Mcvt)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Moisture Condition Value (MCV) test number</th>
	<th>Moisture content</th>
	<th>Method of interpretation of the test curve</th>
	<th>MCV value for MCVT_TESN</th>
	<th>After test bulk density for MCVT_TESN</th>
	<th>Difference between initial (n) and final (3n) blows in rapid assessment test</th>
	<th>Stronger or weaker than pre-calibrated standard</th>
	<th>Remarks</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Mcvt" />
	</table>
	</xsl:if>
	
<h3>Density Tests (Lden)</h3>
	<xsl:if test="count(Lden)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Type of test performed ()</th>
	<th>Sample condition ()</th>
	<th>Type of sample ()</th>
	<th>Moisture content (%)</th>
	<th>Bulk density (Mg/m3)</th>
	<th>Dry density (Mg/m3)</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Name of testing laboratory/organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Lden" />
	</table>
	</xsl:if>

<h3>Dynamic Testing (Ldyn)</h3>
	<xsl:if test="count(Ldyn)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>P-wave velocity (m/s)</th>
	<th>S-wave velocity (m/s)</th>
	<th>Dynamic elastic modulus (GPa)</th>
	<th>Shear modulus derived from LDYN_SWAV (GPa)</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Name of testing laboratory/organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Ldyn" />
	</table>
	</xsl:if>

<h3>Linear Shrinkage Tests (Llin)</h3>
	<xsl:if test="count(Llin)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Linear shrinkage (%)</th>
	<th>Percentage passing 425µm sieve (%)</th>
	<th>Method of preparation ()</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Name of testing laboratory/organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Llin" />
	</table>
	</xsl:if>

<h3>Liquid and Plastic Limit Tests (Llpl)</h3>
	<xsl:if test="count(Llpl)>0">
	<table>
		<th>Location identifier ()</th>
		<th>Depth to the TOP of sample (m)</th>
		<th>Sample Reference number ()</th>
		<th>Sample type ()</th>
		<th>Sample unique global identifier ()</th>
		<th>Specimen reference number ()</th>
		<th>Specimen depth (m)</th>
		<th>Specimen description ()</th>
		<th>Details of specimen preparation including time between preparation and testing ()</th>
		<th>Liquid limit (%)</th>
		<th>Plastic limit (%)</th>
		<th>Plasticity Index (%)</th>
		<th>Percentage passing 425µm sieve (%)</th>
		<th>Method of preparation ()</th>
		<th>Amount of stabiliser added (%)</th>
		<th>Type of stabiliser added ()</th>
		<th>Remarks ()</th>
		<th>Test method ()</th>
		<th>Name of testing laboratory/organisation ()</th>
		<th>Accrediting body and reference number (when appropriate) ()</th>
		<th>Test Status ()</th>
		<th>Associated file reference ()</th>
	<xsl:apply-templates select="Llpl" />
	</table>
	</xsl:if>

<h3>Moisture Content Tests (Lnmc)</h3>
	<xsl:if test="count(Lnmc)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Moisture Content (%)</th>
	<th>Temperature sample dried at (%)</th>
	<th>Amount of stabiliser added (%)</th>
	<th>Type of stabiliser added ()</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Name of testing laboratory/organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Lnmc" />
	</table>
	</xsl:if>
	
<h3>Moisture Content Tests (Lpdm)</h3>
	<xsl:if test="count(Lpdm)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Particle density with prefix # if value assumed (Mg/m3)</th>
	<th>Type of test ()</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Name of testing laboratory/organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Lpdm" />
	</table>
	</xsl:if>

<h3>Laboratory Hand Penetrometer Tests (Lpen)</h3>
	<xsl:if test="count(Lpen)>0">
	<table>
		<th>Location identifier ()</th>
		<th>Depth to the TOP of sample (m)</th>
		<th>Sample Reference number ()</th>
		<th>Sample type ()</th>
		<th>Sample unique global identifier ()</th>
		<th>Specimen reference number ()</th>
		<th>Specimen depth (m)</th>
		<th>Specimen description ()</th>
		<th>Details of specimen preparation including time between preparation and testing ()</th>
		<th>Hand penetrometer undrained shear strength (kPa)</th>
		<th>Moisture content local to test, if measured (%)</th>
		<th>Remarks ()</th>
		<th>Test method ()</th>
		<th>Name of testing laboratory/organisation ()</th>
		<th>Accrediting body and reference number (when appropriate) ()</th>
		<th>Test Status ()</th>
		<th>Associated file reference ()</th>
	<xsl:apply-templates select="Lpen" />
	</table>
	</xsl:if>

<h3>Laboratory Resistivity Tests (Lres)</h3>
	<xsl:if test="count(Lres)>0">
	<table>
		<th>Location identifier ()</th>
		<th>Depth to the TOP of sample (m)</th>
		<th>Sample Reference number ()</th>
		<th>Sample type ()</th>
		<th>Sample unique global identifier ()</th>
		<th>Specimen reference number ()</th>
		<th>Specimen depth (m)</th>
		<th>Specimen description ()</th>
		<th>Details of specimen preparation including time between preparation and testing ()</th>
		<th>Bulk density (Mg/m3)</th>
		<th>Dry density (Mg/m3)</th>
		<th>Moisture content (%)</th>
		<th>Sample condition including details of remoulding ()</th>
		<th>Temperature corrected (20 degC) resistivity (ohm m)</th>
		<th>Diameter of container (mm)</th>
		<th>Container cross-sectional area (mm2)</th>
		<th>Length of container (mm)</th>
		<th>Temperature at which test performed (degC)</th>
		<th>Type of electrodes including material ()</th>
		<th>Dimensions of probes, diameter,spacing, penetration into the soil specimen and whether inserted into ends or side ()</th>
		<th>Shape of container ()</th>
		<th>Volume of water required to saturate the soil (ml)</th>
		<th>Water resitivity (ohm m)</th>
		<th>Approximate percentage of large particles removed prior to test ()</th>
		<th>Remarks ()</th>
		<th>Test method ()</th>
		<th>Name of testing laboratory/organisation ()</th>
		<th>Accrediting body and reference number (when appropriate) ()</th>
		<th>Test Status ()</th>
		<th>Associated file reference ()</th>
	</table>
	<xsl:apply-templates select="Lres" />
	</xsl:if>

<h3>Shrinkage Limit Tests (Lslt)</h3>
	<xsl:if test="count(Lslt)>0">
	<table>
		<th>Location identifier ()</th>
		<th>Depth to the TOP of sample (m)</th>
		<th>Sample Reference number ()</th>
		<th>Sample type ()</th>
		<th>Sample unique global identifier ()</th>
		<th>Specimen reference number ()</th>
		<th>Specimen depth (m)</th>
		<th>Specimen description ()</th>
		<th>Details of specimen preparation including time between preparation and testing ()</th>
		<th>Shrinkage limit (%)</th>
		<th>Shrinkage ratio ()</th>
		<th>Initial density (Mg/m3)</th>
		<th>nitial moisture content of test specimen (%)</th>
		<th>Percentage passing 425µm sieve (%)</th>
		<th>Remarks ()</th>
		<th>Test method ()</th>
		<th>Name of testing laboratory/organisation ()</th>
		<th>Accrediting body and reference number (when appropriate) ()</th>
		<th>Test Status ()</th>
		<th>Associated file reference ()</th>
	</table>
	<xsl:apply-templates select="Lslt" />
	</xsl:if>

<h3>Initial Consumption of Lime Tests - General (Lstg)</h3>
	<xsl:if test="count(Lstg)>0">
	<table>
		<th>Location identifier ()</th>
		<th>Depth to the TOP of sample (m)</th>
		<th>Sample Reference number ()</th>
		<th>Sample type ()</th>
		<th>Sample unique global identifier ()</th>
		<th>Specimen reference number ()</th>
		<th>Specimen depth (m)</th>
		<th>Specimen description ()</th>
		<th>Details of specimen preparation including time between preparation and testing ()</th>
		<th>Initial consumption of lime (%)</th>
		<th>pH value used for interpretation of LSTG_ICL ()</th>
		<th>Details of lime used for test ()</th>
		<th>pH of saturated lime solution (suitability) ()</th>
		<th>Percentage passing 425µm sieve (%)</th>
		<th>Remarks ()</th>
		<th>Test method ()</th>
		<th>Name of testing laboratory/organisation ()</th>
		<th>Accrediting body and reference number (when appropriate) ()</th>
		<th>Test Status ()</th>
		<th>Associated file reference ()</th>
	</table>
	<xsl:apply-templates select="Lstg" />
	</xsl:if>
	
<h3>Initial Consumption of Lime Tests - Data (Lstt)</h3>
	<xsl:if test="count(Lstt)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Test reference ()</th>
	<th>Percentage of lime added (%)</th>
	<th>pH of lime/soil suspension ()</th>
	<th>Remarks ()</th>
	<th>Associated file reference ()</th>
	</table>
	<xsl:apply-templates select="Lstt" />
	</xsl:if>

<h3>Swelling Index Testing (Lswl)</h3>
	<xsl:if test="count(Lswl)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Swelling Pressure Index (kPa)</th>
	<th>Swelling Strain Index (%)</th>
	<th>Moisture content (%)</th>
	<th>Specimen diameter (mm)</th>
	<th>Specimen thickness (%)</th>
	<th>Bulk density (Mg/m3)</th>
	<th>Dry density (Mg/m3)</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Name of testing laboratory/organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Lswl" />
	</table>
	</xsl:if>

<h3>Laboratory Vane Tests (Lvan)</h3>
	<xsl:if test="count(Lvan)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Vane undrained shear strength (peak) (kPa)</th>
	<th>Vane undrained shear strength (remoulded) (kPa)</th>
	<th>Moisture content local to the test (%)</th>
	<th>Equivalent diameter of vane (mm)</th>
	<th>Length of vane (mm)</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Name of testing laboratory/organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Lvan" />
	</table>
	</xsl:if>

<h3>Laboratory Permeability Tests (Ptst)</h3>
	<xsl:if test="count(Ptst)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Permeability test number ()</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Sample condition ()</th>
	<th>Size cut off of material too coarse for testing (mm)</th>
	<th>Diameter of test sample (mm)</th>
	<th>Length of test sample (mm)</th>
	<th>Initial moisture content (%)</th>
	<th>Initial bulk density of test sample (Mg/m3)</th>
	<th>Dry density of test sample (Mg/m3)</th>
	<th>Diameter of drain for radial permeability in hydraulic cell (mm)</th>
	<th>Method of forming central drain ()</th>
	<th>Void ratio of test sample ()</th>
	<th>Coefficient of permability (m/s)</th>
	<th>Mean effective stress at which permeability measured (when measured in triaxila cell) (kN/m2)</th>
	<th>Hydraulic gradient at which permeability measured (for constant head test). ()</th>
	<th>Initial degree of saturation (%)</th>
	<th>Details of saturation, where appropriate ()</th>
	<th>Details of consolidation, where appropriate ()</th>
	<th>Particle density measured or assumed (Mg/m3)</th>
	<th>Type of permeability measurement ()</th>
	<th>Type of permeameter ()</th>
	<th>Permeability test method ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>

	<xsl:apply-templates select="Ptst" />
	</table>
	</xsl:if>

<h3>Relative Density Test (Reld)</h3>
	<xsl:if test="count(Reld)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Maximum dry density as BS 1377 part 4 cl 4 (Mg/m3)</th>
	<th>Weight percent of sample retained on 37.5mm sieve (%)</th>
	<th>Weight percent of sample retained on 6.3mm sieve (%)</th>
	<th>Weight percent of sample retained on 2mm sieve (%)</th>
	<th>Minimum dry density as BS 1377 part 4 cl 4 (Mg/m3)</th>
	<th>Method of test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Reld" />
	</table>
	</xsl:if>
	
<h3>Chalk Crushing Value Tests (Rccv)</h3>
	<xsl:if test="count(Rccv)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Test reference ()</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Chalk natural moisture content (%)</th>
	<th>Chalk crusiing value as BS 1377 Part 4 Cl 6 ()</th>
	<th>Weight percent of material retained on 10mm sieve (%)</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Rccv" />
	</table>
	</xsl:if>	

<h3>Rock Porosity and Density Tests (Rden)</h3>
	<xsl:if test="count(Rden)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Water content of specimen (%)</th>
	<th>Saturated water content of specimen (%)</th>
	<th>Bulk density (kg/m3)</th>
	<th>Dry density (kg/m3)</th>
	<th>Porosity (%)</th>
	<th>Apparent particle density (kg/m3)</th>
	<th>Temperature sample dried at (degC)</th>
	<th>Method of test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Rden" />
	</table>
	</xsl:if>	

<h3>Tensile Strength Testing (Rten)</h3>
	<xsl:if test="count(Rten)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Specimen diameter (mm)</th>
	<th>Specimen thickness (mm)</th>
	<th>Water content of test specimen (%)</th>
	<th>Condition of specimen as tested ()</th>
	<th>Test duration (mm:ss)</th>
	<th>Stress rate (N/s)</th>
	<th>Stress rate (MPa)</th>
	<th>Mode of failure ()</th>
	<th>Testing machine ()</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Rten" />
	</table>
	</xsl:if>	

<h3>Rock Uniaxial Compressive Strength and Deformability Tests (Rucs)</h3>
	<xsl:if test="count(Rucs)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Specimen diameter (mm)</th>
	<th>Specimen thickness (mm)</th>
	<th>Water content of test specimen (%)</th>
	<th>Condition of specimen as tested ()</th>
	<th>Test duration (mm:ss)</th>
	<th>Stress rate (N/s)</th>
	<th>Uniaxial compressive strength (size corrected) (%)</th>
	<th>Mode of failure ()</th>
	<th>Elastic modulus (MN/m2)</th>
	<th>Poisson's ratio ()</th>
	<th>Stress level at which modulus has been measured ()</th>
	<th>Method of determination of Young's modulus ()</th>
	<th>Testing machine ()</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Name of testing laboratory/organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Rucs" />
	</table>
	</xsl:if>	

<h3>Water Content of Rock Tests (Rwco)</h3>
	<xsl:if test="count(Rwco)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Water Content (%)</th>
	<th>Temperature sample dried at (degC)</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Name of testing laboratory/organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Rwco" />
	</table>
	</xsl:if>	
	
<h3>Shear Box Testing - General (Shbg)</h3>
	<xsl:if test="count(Shbg)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Test type eg small shear box, large shear box, ring shear ()</th>
	<th>Sample condition ()</th>
	<th>Specific condition statements ()</th>
	<th>Peak cohesion intercept (kN/m2)</th>
	<th>Peak angle of friction (deg)</th>
	<th>Residual ohesion intercept (kN/m2)</th>
	<th>Residual angle of friction (deg)</th>
	<th>Method of encapsulation of specimens tested ()</th>
	<th>Test notes eg undisturbed, pre-exsiting shear, recompacted, rock joint, cut plane ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Shbg" />
	</table>
	</xsl:if>
	
<h3>Shear Box Testing (Shbt)</h3>
	<xsl:if test="count(Shbg/shbResults/Shbt)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen depth (m)</th>
	<th>Shear box stage number ()</th>
	<th>Bulk density (Mg/m3)</th>
	<th>Dry density (Mg/m3)</th>
	<th>Shear box normal stress (kN/m2)</th>
	<th>Displacement rate for peak stress stage (mm/min)</th>
	<th>Displacement rate for residual stress stage (mm/min)</th>
	<th>Number of traverses if residual test ()</th>
	<th>Shear box peak shear stress (kN/m2)</th>
	<th>Shear box residual shear stress (kN/m2)</th>
	<th>Displacement at peak shear strength (mm)</th>
	<th>Displacement at residual shear strength (mm)</th>
	<th>Particle density, measured or assumed (Mg/m3)</th>
	<th>Initial voids ratio ()</th>
	<th>Initial moisture content (%)</th>
	<th>Final moisture content (%)</th>
	<th>Specimen diameter in direction of shear (rock joints) (mm)</th>
	<th>Specimen diameter perpendicular to shear (rock joints) (mm)</th>
	<th>Specimen height (mm)</th>
	<th>Failure/residual strength criterion used ()</th>
	<th>Remarks on test stage ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Shbg/shbResults/Shbt" />
	</table>
	</xsl:if>	

<h3>Suction Testing (Suct)</h3>
	<xsl:if test="count(Suct)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Specimen diameter (mm)</th>
	<th>Specimen length (mm)</th>
	<th>Sample condition ()</th>
	<th>Bulk density (Mg/m3)</th>
	<th>Dry density (Mg/m3)</th>
	<th>Initial moisture content (%)</th>
	<th>Suction value (kN/m2)</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Suct" />
	</table>
	</xsl:if>
	
<h3>Ten Per Cent Fines (Tnpc)</h3>
	<xsl:if test="count(Tnpc)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Ten per cent fine test number ()</th>
	<th>10% fines values on dry aggregate (kN)</th>
	<th>10% fines values on wet aggregate (kN)</th>
	<th>Notes on testing as per BS 812 ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Tnpc" />
	</table>
	</xsl:if>

<h3>Triaxial Tests - Effective Stress - General (Treg)</h3>
	<xsl:if test="count(Treg)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Test type ()</th>
	<th>Sample condition ()</th>
	<th>Cohesion intercept associated with TRIG_PHI (kN/m2)</th>
	<th>Angle of friction for effective shear strength triaxial test (kN/m2)</th>
	<th>Failure criterion ()</th>
	<th>Remarks on test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Treg" />
	</table>
	</xsl:if>
	
<h3>Triaxial Tests - Effective Stress - Data(Tret)</h3>
	<xsl:if test="count(Treg/treResults/Tret)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Triaxial test/stage number ()</th>
	<th>Specimen diameter (mm)</th>
	<th>Sample length (mm)</th>
	<th>Speciment initial moisture content (%)</th>
	<th>Speciment final moisture content (%)</th>
	<th>Bulk Density (Mg/m3)</th>
	<th>Dry density (%)</th>
	<th>Method of saturation ()</th>
	<th>Details of consolidation stage ()</th>
	<th>Effective stress at end of consolidation/ start of shear stage (kN/m2)</th>
	<th>Total cell pressure during shearing stage (kN/m2)</th>
	<th>Pore water pressure at start of shear stage (%)</th>
	<th>Rate of strain during shearing stage (%)</th>
	<th>Strain at failure (%)</th>
	<th>Deviator stress at failure (kN/m2)</th>
	<th>Porewater pressure at failure (kN/m2)</th>
	<th>Volumetric strain at failure (drained only) (%)</th>
	<th>Mode of failure ()</th>
	<th>Remarks on test ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Treg/treResults/Tret" />
	</table>
	</xsl:if>

<h3>Triaxial Tests - Total Stress - General (Trig)</h3>
	<xsl:if test="count(Trig)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Test type ()</th>
	<th>Sample condition ()</th>
	<th>Remarks on test ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Trig" />
	</table>
	</xsl:if>

<h3>Triaxial Tests - Total Stress - Data (Trit)</h3>
	<xsl:if test="count(Trig/triResults/Trit)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Triaxial test/stage number ()</th>
	<th>Specimen diameter (mm)</th>
	<th>Sample length (mm)</th>
	<th>Speciment initial moisture content (%)</th>
	<th>Speciment final moisture content (%)</th>
	<th>Total cell pressure (kN/m2)</th>
	<th>Deviator stress at failure (kN/m2)</th>
	<th>Initial bulk density (Mg/m3)</th>
	<th>Initial dry density (%)</th>
	<th>Strain at failure (%)</th>
	<th>Mode of failure ()</th>
	<th>Remarks on test ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Trig/triResults/Trit" />
	</table>
	</xsl:if>
	
</xsl:template>

<xsl:template name="monitoring">

<h2>monitoring</h2>

<h3>Monitoring Installations and Instruments (Mong)</h3>
	<xsl:if test="count(Mong)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Monitoring Point identifier ()</th>
	<th>Distance of monitoring point from HOLE_ID (m)</th>
	<th>Pipe1 ()</th>
	<th>Installation date (dd/mm/yyyy)</th>
	<th>Instrument type ()</th>
	<th>Details of instrument ()</th>
	<th>Distance to top of response zone from HOLE_ID datum (m)</th>
	<th>Distance to base of response zone from HOLE_ID datum (m)</th>
	<th>Bearing of monitoring axis A (compass bearing) (deg)</th>
	<th>Bearing of monitoring axis B (compass bearing) (deg)</th>
	<th>Bearing of monitoring axis C (compass bearing) (deg)</th>
	<th>Inclination of instrument axis A (measured positively down from horizontal) (deg)</th>
	<th>Inclination of instrument axis B (measured positively down from horizontal) (deg)</th>
	<th>Inclination of instrument axis C (measured positively down from horizontal) (deg)</th>
	<th>Reading sign convention in direction A ()</th>
	<th>Reading sign convention in direction B ()</th>
	<th>Reading sign convention in direction C ()</th>
	<th>Remarks ()</th>
	<th>Name of testing organisation ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Mong" />
	</table>
	</xsl:if>
	
<h3>Monitoring Reading(Mond)</h3>
	<xsl:if test="count(Mond)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Monitoring Point identifier ()</th>
	<th>Distance of monitoring point from HOLE_ID (m)</th>
	<th>Date and time of reading</th>
	<th>Reading Type</th>
	<th>Instrument type ()</th>
	<th>Reading reference</th>
	<th>Instrument reference / serial number</th>
	<th>Distance to base of response zone from HOLE_ID datum (m)</th>
	<th>Reading</th>
	<th>Unit of reading</th>
	<th>Test method</th>
	<th>Instrument/method reading/detection limit</th>
	<th>Instrument/method upper reading/detection (when appropriate)</th>
	<th>Client preferred name of measurement</th>
	<th>Accrediting body and reference number (when appropriate)</th>
	<th>Name of testing organisation</th>
	<th>Details for instrument reference, probe logger, serial numbersRemarks</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Mond" />
	</table>
	</xsl:if>
	
<h3>Time Related Remarks (Trem)</h3>
	<xsl:if test="count(Trem)>0">
	<table>
	<th>Exploratory hole or location equivalent ()</th>
	<th>Date of remark (dd/mm/yyyy)</th>
	<th>Time of remark (hr:mm:ss)</th>
	<th>Time related remark ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Trem" />
	</table>
	</xsl:if>
	
</xsl:template>

<xsl:template name="fieldTesting">

<h2>fieldTesting</h2>

<h3>Dynamic Cone Penetrometer Tests - General (Dcpg) </h3>
	<xsl:if test="count(Dcpg)>0">
	<table>
		<th>Location identifier ()</th>
		<th>Test date (yyyy-mm-dd)</th>
		<th>Test reference ()</th>
		<th>Depth from surface to start of test (m)</th>
		<th>Zero reading (mm)</th>
		<th>Details of surface and base layers removed prior to/during the test (if applicable) ()</th>
		<th>Test Remarks ()</th>
		<th>Details of weather and environmental conditions during test ()</th>
		<th>Test method ()</th>
		<th>Name of testing organisation ()</th>
		<th>Accrediting body and reference number (when appropriate) ()</th>
		<th>Test Status ()</th>
		<th>Associated file reference ()</th>
		<xsl:apply-templates  select="Dcpg" />
	</table>
	</xsl:if>
	
<h3>Dynamic Cone Penetrometer Tests - Data </h3>
	<xsl:if test="count(Dcpt)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Test date (yyyy-mm-dd)</th>
	<th>Test reference ()</th>
	<th>Depth from surface to start of test (m)</th>
	<th>Cumulative blows ()</th>
	<th>Penetration at DCPT_CBLO (mm)</th>
	<th>Delay before increment started (hh:mm)</th>
	<th>Test reading remarks ()</th>
	<xsl:apply-templates  select="Dcpt" />
	</table>
	</xsl:if>

<h3>Dynamic Probe Test - General (Dprg) </h3>
	<xsl:if test="count(Dprg)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Dynamic probe type ()</th>
	<th>Test method ()</th>
	<th>Hammer mass (kg)</th>
	<th>Standard drop height (mm)</th>
	<th>Cone base diameter (mm)</th>
	<th>Rod diameter (mm)</th>
	<th>Type of anvil damper ()</th>
	<th>Depth of cone if left in the ground (m)</th>
	<th>General remarks ()</th>
	<th>Cone angle (deg)</th>
	<th>Rod Mass (kg/m)</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Dprg" />
	</table>
	</xsl:if>
	
<h3>Dynamic Probe Test(Dprb) </h3>
	<xsl:if test="count(Dprb)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to start of dynamic propbe increment (m)</th>
	<th>Dynamic probe blows for increment DPRB_INC ()</th>
	<th>Cumulative blows for test ()</th>
	<th>Maximum torque required to rotate rods (Nm)</th>
	<th>Duration of delay before increment started (hhmm)</th>
	<th>Dynamic probe increment (mm)</th>
	<th>Notes on events during increment ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Dprb" />
	</table>
	</xsl:if>
	
<h3>Insitu CBR Test (Icbr) </h3>
	<xsl:if test="count(Icbr)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth of test (m)</th>
	<th>Test number ()</th>
	<th>CBR value (%)</th>
	<th>Test date (dd/mm/yyyy)</th>
	<th>Details of kentledge (reaction load) ()</th>
	<th>Seating force (N)</th>
	<th>Surcharge Pressure (kN/m2)</th>
	<th>Type of CBR ()</th>
	<th>Remarks ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Test method ()</th>
	<th>Name of testing organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Stratum reference shown on trial pit or traverse sketch ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Icbr" />
	</table>
	</xsl:if>
	
<h3>Insitu Density Test (Iden) </h3>
	<xsl:if test="count(Iden)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth of insitu density test ()</th>
	<th>Test number ()</th>
	<th>Test date (dd/mm/yyyy)</th>
	<th>Type of density test performed ()</th>
	<th>Insitu bulk density (Mg/m3)</th>
	<th>Moisture content relating to in situ test (%)</th>
	<th>Amount of stabiliser added (%)</th>
	<th>Type of stabiliser added ()</th>
	<th>Remarks ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Test method ()</th>
	<th>Name of testing organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Stratum reference shown on trial pit or traverse sketch ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Iden" />
	</table>
	</xsl:if>
	
<h3>On Site Volatile Headspace Testing Using Flame Ionisation Detector (Ifid) </h3>
	<xsl:if test="count(Ifid)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth of headspace test sample (m)</th>
	<th>Test number ()</th>
	<th>Test date (dd/mm/yyyy)</th>
	<th>Result of FID analysis (ppmv)</th>
	<th>Details of FID used amd method description ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Test method ()</th>
	<th>Name of testing organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Stratum reference shown on trial pit or traverse sketch ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Ifid" />
	</table>
	</xsl:if>
	
<h3>On Site Volatile Headspace Testing by Photo Ionisation Detector (Ipid) </h3>
	<xsl:if test="count(Ipid)>0">
	
	<table>
	<th>Location identifier ()</th>
	<th>Depth of headspace test sample (m)</th>
	<th>Test number ()</th>
	<th>Test date (yyyy-mm-dd)</th>
	<th>Ambient temperature at time of test (degC)</th>
	<th>Result of PID analysis (ppmv)</th>
	<th>Details of FID used amd method description ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Test method ()</th>
	<th>Name of testing organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Stratum reference shown on trial pit or traverse sketch ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Ipid" />
	</table>
	</xsl:if>
	
<h3>In Situ Hand Penetrometer Tests (Ipen) </h3>
	<xsl:if test="count(Ipen)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth of test (m)</th>
	<th>Test number ()</th>
	<th>Hand penetrometer result (kPa)</th>
	<th>Test date (dd/mm/yyyy)</th>
	<th>Remarks on test ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Test method ()</th>
	<th>Name of testing organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Stratum reference shown on trial pit or traverse sketch ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Ipen" />
	</table>
	</xsl:if>
	
<h3>Insitu Permeability Tests - General(Iprg) </h3>
	<xsl:if test="count(Iprg)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to TOP of test zone (m)</th>
	<th>Test number ()</th>
	<th>Depth to BASE of test zone (m)</th>
	<th>Stage number of multistage packer test ()</th>
	<th>Type of test ()</th>
	<th>depth to water in borehole or piezometer immediately prior to test (m)</th>
	<th>Depth to water at start of test (m)</th>
	<th>Diameter of test zone (m)</th>
	<th>Diameters of standpipe or casing (m)</th>
	<th>Permeability (m/s)</th>
	<th>Average flow during packer test stage (l/s)</th>
	<th>Depth to assumed standing water level (m)</th>
	<th>Applied total head of water during test stage at centre of packer test zone (m)</th>
	<th>Test date (dd/mm/yyyy)</th>
	<th>Test Remarks ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Test method ()</th>
	<th>Name of testing organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Iprg" />
	</table>
	</xsl:if>

<h3>Insitu Permeability Tests - Data (Iprt) </h3>
	<xsl:if test="count(Iprt)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to TOP of test zone (m)</th>
	<th>Test number ()</th>
	<th>Depth to BASE of test zone (m)</th>
	<th>Stage number of multistage packer test ()</th>
	<th>Elapsed time (hh:mm:ss)</th>
	<th>Depth to water at time IPRT_TIME (m)</th>
	<th>Remarks on test ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Iprt" />
	</table>
	</xsl:if>

<h3>Insitu Redox Test (Irdx) </h3>
	<xsl:if test="count(Irdx)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth of redox test (m)</th>
	<th>Test number ()</th>
	<th>Test date (dd/mm/yyyy)</th>
	<th>pH ()</th>
	<th>Mean value of the potential of the two platinum probes ()</th>
	<th>Redox potential (mV)</th>
	<th>Details of redox test and probe type ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Test method ()</th>
	<th>Name of testing organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Stratum reference shown on trial pit or traverse sketch ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Irdx" />
	</table>
	</xsl:if>

<h3>Insitu Resestivity Test (Ires) </h3>
	<xsl:if test="count(Ires)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth range to which in situ resistivity test relates (m)</th>
	<th>Test number ()</th>
	<th>Base depth to which in-situ resistivity test relates (m)</th>
	<th>Type of resistivity test ()</th>
	<th>Test date (dd/mm/yyyy)</th>
	<th>Mean value of the apparent resistivity (ohm cm)</th>
	<th>First value of apparent resistivity when more than 15% different to mean (ohm cm)</th>
	<th>Second value of apparent resistivity when more than 15% different to mean (ohm cm)</th>
	<th>Details of test eg electrode spacing and configuration ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Test method ()</th>
	<th>Name of testing organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Stratum reference shown on trial pit or traverse sketch ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Ires" />
	</table>
	</xsl:if>	
	
<h3>Soakaway Tests - General (Isag) </h3>
	<xsl:if test="count(Isag)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Test number ()</th>
	<th>Test date (yyyy-mm-dd)</th>
	<th>Type of resistivity test (hh:mm)</th>
	<th>Soakaway pit width (m)</th>
	<th>Soakaway pit length (m)</th>
	<th>Soakaway pit diameter (m)</th>
	<th>Soakaway pit depth at start of test (m)</th>
	<th>Soakaway pit depth at end of test (m)</th>
	<th>Description of soakaway construction ()</th>
	<th>soil infiltration rate (m/s)</th>
	<th>fill porosity (%)</th>
	<th>Details of test eg electrode spacing and configuration ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Test method ()</th>
	<th>Name of testing organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Isag" />
	</table>
	</xsl:if>

<h3>Soakaway Tests - Data (Isat) </h3>
	<xsl:if test="count(Isat)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Test number ()</th>
	<th>Elapsed time (hh:mm)</th>
	<th>Depth to water (m)</th>
	<th>Remark relating to test reading ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Isat" />
	</table>
	</xsl:if>
	
<h3>Standard Penetration Test Results (Ispt) </h3>
	<xsl:if test="count(Ispt)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to top of test (m)</th>
	<th>Number of blows for seating drive ()</th>
	<th>Number of blows for main test drive ()</th>
	<th>Total pentration of seating drive and test drive (mm)</th>
	<th>SPT'N' value ()</th>
	<th>SPT reported result ()</th>
	<th>Casing depth at time of test (m)</th>
	<th>Depth to water at time of test (m)</th>
	<th>Type of SPT Test ()</th>
	<th>Hammer serial number from manufacturer ()</th>
	<th>Energy ratio of the hammer (%)</th>
	<th>Self-weight penetration (mm)</th>
	<th>Number of blows for 1st Increment (Seating) ()</th>
	<th>Number of blows for 2nd Increment (Seating) ()</th>
	<th>Number of blows for 3rd Increment (Test) ()</th>
	<th>Number of blows for 4th Increment (Test) ()</th>
	<th>Number of blows for 5th Increment (Test) ()</th>
	<th>Number of blows for 6th Increment (Test) ()</th>
	<th>Penetration for 1st Increment (Seating Drive) (mm)</th>
	<th>Penetration for 2nd Increment (Seating Drive) (mm)</th>
	<th>Penetration for 3rd Increment (Test) (mm)</th>
	<th>Penetration for 4th Increment (Test) (mm)</th>
	<th>Penetration for 5th Increment (Test) (mm)</th>
	<th>Penetration for 6th Increment (Test) (mm)</th>
	<th>SPT carried out in rock ()</th>
	<th>Remarks ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Test method ()</th>
	<th>Name of testing organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Ispt" />
	</table>
	</xsl:if>
	
<h3>Insitu Vane Test (Ivan) </h3>
	<xsl:if test="count(Ivan)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth of vane test (m)</th>
	<th>Test number ()</th>
	<th>Vane type ()</th>
	<th>Vane test result (kN/m2)</th>
	<th>Vane test remoulded result (kN/m2)</th>
	<th>Test date (dd/mm/yyyy)</th>
	<th>Details of vane test, vane size, vane type ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Test method ()</th>
	<th>Name of testing organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Stratum reference shown on trial pit or traverse sketch ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Ivan" />
	</table>
	</xsl:if>	

<h3>Pressuremeter Test Results, General(Pmtg) </h3>
	<xsl:if test="count(Pmtg)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth of test (m)</th>
	<th>Test reference ()</th>
	<th>Date of test (dd/mm/yyyy)</th>
	<th>Measured or assumed ground water level (m)</th>
	<th>Name of testing organisation ()</th>
	<th>Operator details ()</th>
	<th>Instrument reference / serial number ()</th>
	<th>Pressuremeter type ()</th>
	<th>Uninflated diameter of pressuremeter (mm)</th>
	<th>Estimated in situ horizontal stress (kN/m2)</th>
	<th>Initial shear modulus (MN/m2)</th>
	<th>Undrained shear strength (kN/m2)</th>
	<th>Limit pressure (kN/m2)</th>
	<th>Angle of friction (deg)</th>
	<th>Angle of dilation (deg)</th>
	<th>Angle of friction at constant volume (*cv) used (deg)</th>
	<th>Test method ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Remarks ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Pmtg" />
	</table>
	</xsl:if>
	
<h3>Pressuremeter Test Data (Pmtd) </h3>
	<xsl:if test="count(Pmtd)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth of test (m)</th>
	<th>Test reference ()</th>
	<th>Sequence No ()</th>
	<th>Arm (pair) 1 displacement (mm)</th>
	<th>Arm (pair) 2 displacement (mm)</th>
	<th>Arm (pair) 3 displacement (mm)</th>
	<th>Total Pressure (pair) 1 (kN/m2)</th>
	<th>Pore Pressure cell A (kPa)</th>
	<th>Pore Pressure cell B (kPa)</th>
	<th>Volume change in test cell (cm3)</th>
	<th>Remarks ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Pmtd" />
	</table>
	</xsl:if>	
	
<h3>Pressuremeter Test Results, Individual Loops (Pmtl) </h3>
	<xsl:if test="count(Pmtl)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth of test (m)</th>
	<th>Test reference ()</th>
	<th>Sequence No ()</th>
	<th>Unload Reload loop number ()</th>
	<th>Unload reload shear modulus average (MPa)</th>
	<th>Mean strain (%)</th>
	<th>Mean pressure (kPa)</th>
	<th>Strain range or amplitude (%)</th>
	<th>Pressure range or amplitude (kPa)</th>
	<th>Shear stress coefficient (from Bolton and Whittle, 1999) (MPa)</th>
	<th>Linearity exponent (from Bolton and Whittle, 1999) ()</th>
	<th>Remarks ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Pmtl" />
	</table>
	</xsl:if>
	
<h3>Plate Loading Tests - General (Pltg) </h3>
	<xsl:if test="count(Pltg)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Test depth (m)</th>
	<th>Installation date ()</th>
	<th>Load Cycle ()</th>
	<th>Plate diameter (mm)</th>
	<th>Seating load including apparatus mass (kN)</th>
	<th>factor a0 ()</th>
	<th>factor a1 ()</th>
	<th>factor a2 ()</th>
	<th>Strain modulus (MPa)</th>
	<th>Elastic modulus for second loading cycle (MPa)</th>
	<th>Modulus of subgrade reaction (MPa/m)</th>
	<th>Elastic modulus (MPa)</th>
	<th>Test date (yyyy-mm-dd)</th>
	<th>Amount of stabiliser added (%)</th>
	<th>Type of stabiliser added ()</th>
	<th>Remarks ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Test method ()</th>
	<th>Name of testing organisation ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Stratum reference shown on trial pit or traverse sketch ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Pltg" />
	</table>
	</xsl:if>

<h3>Plate Loading Tests - Data (Pltd) </h3>
	<xsl:if test="count(Pltd)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Test depth ()</th>
	<th>Test Reference ()</th>
	<th>Load cycle ()</th>
	<th>Load Stage ()</th>
	<th>Stage elapsed time (min)</th>
	<th>Applied load (kN)</th>
	<th>Settlement Gauge 1 (mm)</th>
	<th>Settlement Gauge 2 (mm)</th>
	<th>Settlement Gauge 3 (mm)</th>
	<th>Settlement Gauge 4 (mm)</th>
	<th>Comments on reading ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Pltd" />
	</table>
	</xsl:if>
	
<h3>Pumping Tests - General (Pumg) </h3>
	<xsl:if test="count(Pumg)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Test reference ()</th>
	<th>Contractor ()</th>
	<th>Test method ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Remark ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Pumg" />
	</table>
	</xsl:if>
	
<h3>Pumping Tests - Data (Pumt) </h3>
	<xsl:if test="count(Pumt)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Test reference ()</th>
	<th>Date and time of reading (yyyy-mm-ddThh:mm)</th>
	<th>Depth to water below ground (m)</th>
	<th>Pumping rate from hole (l/s)</th>
	<th>Remark ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Pumt" />
	</table>
	</xsl:if>	

<h3>Point Load Testing (Rplt) </h3>
	<xsl:if test="count(Rplt)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of sample (m)</th>
	<th>Sample Reference number ()</th>
	<th>Sample type ()</th>
	<th>Sample unique global identifier ()</th>
	<th>Specimen reference number ()</th>
	<th>Specimen depth (m)</th>
	<th>Specimen description ()</th>
	<th>Details of specimen preparation including time between preparation and testing ()</th>
	<th>Uncorrected point load (Is5) (MN/m2)</th>
	<th>Size corrected point load index (Is50) (MN/m2)</th>
	<th>Point load test type (A,D,L or P) ()</th>
	<th>Natural moisture content (%)</th>
	<th>Remarks ()</th>
	<th>Test method ()</th>
	<th>Client/laboratory preferred name of determinand ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Rplt" />
	</table>
	</xsl:if>

<h3>Static Cone Dissipation Tests - General (Scdg) </h3>
	<xsl:if test="count(Scdg)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Test reference or push number ()</th>
	<th>Depth of dissipation test (m)</th>
	<th>Measured or assumed initial pore water pressure (MPa)</th>
	<th>Measured or assumed equilibrium pore water pressure (MPa)</th>
	<th>Degree of dissipation for analysis (%)</th>
	<th>Time to achieve degree of dissipation stated in SCDG_DDIS (s)</th>
	<th>Coefficient of consolidation (vertical) (m2/yr)</th>
	<th>Method(s) used to determine vertical coefficient of consolidation ()</th>
	<th>Coefficient of consolidation (horizontal) (m2/yr)</th>
	<th>Method(s) used to determine horizontal coefficient of consolidation ()</th>
	<th>Remarks ()</th>
	<th>Test Status ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Scdg" />
	</table>
	</xsl:if>

<h3>Static Cone Dissipation Tests - General (Scdt) </h3>
	<xsl:if test="count(Scdt)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Test reference or push number ()</th>
	<th>Depth of dissipation test (m)</th>
	<th>Seconds elapsed since start of test (s)</th>
	<th>Cone resistance (MPa)</th>
	<th>Face porewater pressure (u1) (MPa)</th>
	<th>Shoulder porewater pressure (u2) (MPa)</th>
	<th>Top of sleeve porewater pressure (u3) (MPa)</th>
	<th>Remarks ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Scdt" />
	</table>
	</xsl:if>
	
<h3>Static Cone Penetration Tests - General (Scpg) </h3>
	<xsl:if test="count(Scdg)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Test reference or push number ()</th>
	<th>Cone test type ()</th>
	<th>Cone reference (m)</th>
	<th>Surface area of cone tip (cm2)</th>
	<th>Nominal rate of penetration of the cone (mm/s)</th>
	<th>Type of filter material used ()</th>
	<th>Friction reducer used ()</th>
	<th>Groundwater level at time of test (m)</th>
	<th>Origin of water level in SCPG_WAT ()</th>
	<th>Comments on testing and basis of any interpretated parameters included in SCPT and SCPP ()</th>
	<th>Details of weather and environmental conditions during test ()</th>
	<th>Subcontractors name ()</th>
	<th>Standard followed for testing ()</th>
	<th>Accrediting body and reference number (when appropriate) ()</th>
	<th>Cone area ratio used to calculate qt ()</th>
	<th>Sleeve area ratio used to calculate ft ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Scpg" />
	</table>
	</xsl:if>

<h3>Static Cone Penetration Tests - Data (Scpt) </h3>
	<xsl:if test="count(Scpt)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Test reference or push number ()</th>
	<th>Depth of result (m)</th>
	<th>Cone resistance (qc) (MPa)</th>
	<th>Local unit side friction resistance (fs) (MPa)</th>
	<th>Face porewater pressure (u1) (MPa)</th>
	<th>Shoulder porewater pressure (u2) (MPa)</th>
	<th>Top of sleeve porewater pressure (u3) (MPa)</th>
	<th>Conductivity (uS/cm)</th>
	<th>Temparature (uS/cm)</th>
	<th>pH Reading (uS/cm)</th>
	<th>Slope indicator no. 1 (uS/cm)</th>
	<th>Slope indicator no. 2 (uS/cm)</th>
	<th>Redox potential reading (mV)</th>
	<th>Magnetic flux - Total (calculated) ()</th>
	<th>Magnetic flux - X ()</th>
	<th>Magnetic flux - Y ()</th>
	<th>Magnetic flux - Z ()</th>
	<th>Soil Moisture (%)</th>
	<th>Natural gamma radiation (counts/s)</th>
	<th>Remarks ()</th>
	<th>Friction ratio (Rf) (%)</th>
	<th>Corrected cone resistance (qt) piezocone only (MPa)</th>
	<th>Corrected sleeve resistance (ft) piezocone only (MPa)</th>
	<th>Effective cone resistance (qe) piezocone only (MPa)</th>
	<th>Bulk density of material (measured or assumed) (MPa)</th>
	<th>Total vertical stress (based on SCPT_BDEN) (MPa)</th>
	<th>Effective vertical stress (calculated from SCPT_CPO and SCPT_ISPP or SCPG_WAT) (MPa)</th>
	<th>Net cone resistance (qn) (MPa)</th>
	<th>Corrected friction ratio (Rf') piezocone only (%)</th>
	<th>Excess pore pressure (u-uo) piezocone only (MPa)</th>
	<th>Pore pressure ratio (Bq) piezocone only ()</th>
	<th>In situ pore pressure (uo) (measured or assumed where not simple hydrostatic based on SCPG_WAT) (MPa)</th>
	<th>Normalised cone resistance (Qt) ()</th>
	<th>Normalised friction ratio (Fr) (%)</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Scpt" />
	</table>
	</xsl:if>

<h3>Static Cone Penetration Tests - Derived Parameters (Scpp) </h3>
	<xsl:if test="count(Scpp)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Test reference or push number ()</th>
	<th>Depth to top of layer (m)</th>
	<th>Depth to base of layer (m)</th>
	<th>Interpretation reference ()</th>
	<th>Remarks ()</th>
	<th>Interpreted Soil Type ()</th>
	<th>Undrained Shear Strength (Su); fine soils only (kPa)</th>
	<th>Relative density (Dr); coarse soils only (%)</th>
	<th>Internal Friction Angle; coarse soils only (MPa)</th>
	<th>Soil Behaviour Type Index (Ic) ()</th>
	<th>Equivalent SPT N60 value ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Scpp" />
	</table>
	</xsl:if>

</xsl:template>

<xsl:template name="groundInformation">

<h2>groundInformation</h2>

<h3>Core Information </h3>
	<xsl:if test="count(Core)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to TOP of core run (m)</th>
	<th>Depth to BOT of core run (m)</th>
	<th>Percentage of core recovered in core run (TCR) (%)</th>
	<th>Percentage of solid core recovered in core run (SCR) (%)</th>
	<th>Rock Quality Designation for core run (RQD) (%)</th>
	<th>Core diameter (mm)</th>
	<th>Time taken to drill core run (hh:mm)</th>
	<th>Rotary Remarks ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Core" />
	</table>
	</xsl:if>

<h3>Detail Information </h3>
	<xsl:if test="count(Detl)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to TOP of detail description (m)</th>
	<th>Depth to BASE of detail description (m)</th>
	<th>Detail description (m)</th>
	<th>Remarks ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Detl" />
	</table>
</xsl:if>

<h3>Discontinuity Information </h3>
	<xsl:if test="count(Disc)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to TOP in hole or distance to start traverse, pf discontinuity zone, or discontinuity (m)</th>
	<th>Depth to BASE in hole or distance to end of traverse, of discontinuity zone. (m)</th>
	<th>Discontinuity set reference number ()</th>
	<th>Discontinuity number ()</th>
	<th>Type of discontinuity ()</th>
	<th>Dip of discontinuity (deg)</th>
	<th>Dip direction of discontinuity (deg)</th>
	<th>Small scale roughness (ISRM 1978) ()</th>
	<th>Intermediate scale planarity (ISRM 1978) ()</th>
	<th>Large scale waviness, wavelength (ISRM 1978) (m)</th>
	<th>Large scale waviness, amplitude (ISRM 1978) (m)</th>
	<th>Joint Roughness Coefficient ()</th>
	<th>Surface Appearance ()</th>
	<th>Discontinuity aperture measurement ()</th>
	<th>Discontinuity aperture observation ()</th>
	<th>Infilling material ()</th>
	<th>Discontinuity termination (lower, upper) (ISRM 1978) ()</th>
	<th>Persistance measurement (m)</th>
	<th>Discontinuity wall strength (MPa)</th>
	<th>Discontinuity wall weathering ()</th>
	<th>Seepage rating (ISRM 1978) ()</th>
	<th>Water flow estimates (l/min)</th>
	<th>Remarks ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Disc" />
	</table>
</xsl:if>

<h3>Fracture Information </h3>
	<xsl:if test="count(Frac)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to top in hole or distance to start on traverse, of the zone (m)</th>
	<th>Depth to base in hole or distance to end on traverse, of the zone (m)</th>
	<th>Fracture set reference number ()</th>
	<th>Frcature index over zone (frcatures per meter) ()</th>
	<th>Maximum fracture spacing over zone (mm)</th>
	<th>Average fracture spacing over zone (mm)</th>
	<th>Minimum fracture spacing over zone (mm)</th>
	<th>Remarks on test ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Frac" />
	</table>
	</xsl:if>

<h3>Geology Information </h3>
	<xsl:if test="count(Geol)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to the TOP of stratum (m)</th>
	<th>Depth to the BASE of stratum ()</th>
	<th>General Description of stratum ()</th>
	<th>Legend Code ()</th>
	<th>Geology Code ()</th>
	<th>Secondary Geology Code ()</th>
	<th>Stratum reference shown on trial pit or traverse sketch ()</th>
	<th>BGS Lexicon Code ()</th>
	<th>Geological formation or stratum name ()</th>
	<th>Remarks ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates  select="Geol" />
	</table>
	</xsl:if>

<h3>Weathering Information </h3>
	<xsl:if test="count(Weth)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to TOP of weathering subdivision (m)</th>
	<th>Depth to BASE of weathering subdivision (m)</th>
	<th>Weathering scheme ()</th>
	<th>Material or mass weathering system ()</th>
	<th>Weathering classifier for WETH_SCH and WETH_SYS ()</th>
	<th>Renmarks, weathering system used ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Weth" />
	</table>
	</xsl:if>	
	
<h3>Water Strike - General </h3>
	<xsl:if test="count(Wstg)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to water strike (m)</th>
	<th>Date and time of water strike (yyyy-mm-ddThh:mm)</th>
	<th>Depth at which water strike sealed by casing (m)</th>
	<th>Casing depth at time of water strike (m)</th>
	<th>Remarks on test ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Wstg" />
	</table>
	</xsl:if>
	
<h3>Water Strike Information </h3>
	<xsl:if test="count(Wstk)>0">
	<table>
	<th>Location identifier ()</th>
	<th>Depth to water strike (m)</th>
	<th>Minutes after strike (min)</th>
	<th>Depth to water strike after WSTK_NMIN minutes (m)</th>
	<th>Remarks on test ()</th>
	<th>Associated file reference ()</th>
	<xsl:apply-templates select="Wstk" />
	</table>
	</xsl:if>

</xsl:template>

<xsl:template match="Aavt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="AavtAav"/></td>
		<td><xsl:value-of select="AavtRem"/></td>
		<td><xsl:value-of select="AavtMeth"/></td>
		<td><xsl:value-of select="AavtLab"/></td>
		<td><xsl:value-of select="AavtCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Acvt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="AcvtAcv"/></td>
		<td><xsl:value-of select="AcvtFrac"/></td>
		<td><xsl:value-of select="AcvtRem"/></td>
		<td><xsl:value-of select="AcvtMeth"/></td>
		<td><xsl:value-of select="AcvtLab"/></td>
		<td><xsl:value-of select="AcvtCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Aelo">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="AeloEi"/></td>
		<td><xsl:value-of select="AeloRem"/></td>
		<td><xsl:value-of select="AeloMeth"/></td>
		<td><xsl:value-of select="AeloLab"/></td>
		<td><xsl:value-of select="AeloCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Aflk">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="AflkFi"/></td>
		<td><xsl:value-of select="AflkMass"/></td>
		<td><xsl:value-of select="AflkRem"/></td>
		<td><xsl:value-of select="AflkMeth"/></td>
		<td><xsl:value-of select="AflkLab"/></td>
		<td><xsl:value-of select="AflkCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Aivt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="AivtAiv1"/></td>
		<td><xsl:value-of select="AivtAiv2"/></td>
		<td><xsl:value-of select="AivtAiv"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="AivtPden"/></td>
		<td><xsl:value-of select="AivtRem"/></td>
		<td><xsl:value-of select="AivtMeth"/></td>
		<td><xsl:value-of select="AivtLab"/></td>
		<td><xsl:value-of select="AivtCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Alos">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="AlosLosa"/></td>
		<td><xsl:value-of select="AlosLopw"/></td>
		<td><xsl:value-of select="AlosLopr"/></td>
		<td><xsl:value-of select="AlosFrac"/></td>
		<td><xsl:value-of select="AlosChar"/></td>
		<td><xsl:value-of select="AlosRem"/></td>
		<td><xsl:value-of select="AlosMeth"/></td>
		<td><xsl:value-of select="AlosLab"/></td>
		<td><xsl:value-of select="AlosCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Alos">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="AlosLosa"/></td>
		<td><xsl:value-of select="AlosLopw"/></td>
		<td><xsl:value-of select="AlosLopr"/></td>
		<td><xsl:value-of select="AlosFrac"/></td>
		<td><xsl:value-of select="AlosChar"/></td>
		<td><xsl:value-of select="AlosRem"/></td>
		<td><xsl:value-of select="AlosMeth"/></td>
		<td><xsl:value-of select="AlosLab"/></td>
		<td><xsl:value-of select="AlosCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Apsv">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="ApsvAav"/></td>
		<td><xsl:value-of select="ApsvRem"/></td>
		<td><xsl:value-of select="ApsvMeth"/></td>
		<td><xsl:value-of select="ApsvLab"/></td>
		<td><xsl:value-of select="ApsvCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Artw">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="ArtwFrac"/></td>
		<td><xsl:value-of select="ArtwType"/></td>
		<td><xsl:value-of select="ArtwMd1"/></td>
		<td><xsl:value-of select="ArtwMd2"/></td>
		<td><xsl:value-of select="ArtwMde"/></td>
		<td><xsl:value-of select="ArtwMds"/></td>
		<td><xsl:value-of select="ArtwDate"/></td>
		<td><xsl:value-of select="ArtwRem"/></td>
		<td><xsl:value-of select="ArtwMeth"/></td>
		<td><xsl:value-of select="ArtwLab"/></td>
		<td><xsl:value-of select="ArtwCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Asdi">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="AsdiSdi1"/></td>
		<td><xsl:value-of select="AsdiSdi2"/></td>
		<td><xsl:value-of select="AsdiSoln"/></td>
		<td><xsl:value-of select="AsdiIndr"/></td>
		<td><xsl:value-of select="AsdiPadr"/></td>
		<td><xsl:value-of select="AsdiRem"/></td>
		<td><xsl:value-of select="AsdiMeth"/></td>
		<td><xsl:value-of select="AsdiLab"/></td>
		<td><xsl:value-of select="AsdiCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Asns">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="AsnsSoun"/></td>
		<td><xsl:value-of select="AsnsFrac"/></td>
		<td><xsl:value-of select="AsnsRem"/></td>
		<td><xsl:value-of select="AsnsMeth"/></td>
		<td><xsl:value-of select="AsnsLab"/></td>
		<td><xsl:value-of select="AsnsCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Awad">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="AwadWtab"/></td>
		<td><xsl:value-of select="AwadRem"/></td>
		<td><xsl:value-of select="AwadMeth"/></td>
		<td><xsl:value-of select="AwadLab"/></td>
		<td><xsl:value-of select="AwadCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Bkfl">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="BkflTop"/></td>
		<td><xsl:value-of select="BkflBase"/></td>
		<td><xsl:value-of select="BkflDesc"/></td>
		<td><xsl:value-of select="BkflLeg"/></td>
		<td><xsl:value-of select="BkflDate"/></td>
		<td><xsl:value-of select="BkflRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Cbrg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="CbrgCond"/></td>
		<td><xsl:value-of select="CbrgMeth"/></td>
		<td><xsl:value-of select="CbrgRem"/></td>
		<td><xsl:value-of select="CbrgNMC"/></td>
		<td><xsl:value-of select="CbrgIMC"/></td>
		<td><xsl:value-of select="Cbrg200"/></td>
		<td><xsl:value-of select="CbrgStab"/></td>
		<td><xsl:value-of select="CbrgStyp"/></td>
		<td><xsl:value-of select="CbrgRem"/></td>
		<td><xsl:value-of select="CbrgMeth"/></td>
		<td><xsl:value-of select="CbrgLab"/></td>
		<td><xsl:value-of select="CbrgCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Cbrt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="CbrtTesn"/></td>
		<td><xsl:value-of select="CbrtTop"/></td>
		<td><xsl:value-of select="CbrtBas"/></td>
		<td><xsl:value-of select="CbrtMct"/></td>
		<td><xsl:value-of select="CbrtMcbt"/></td>
		<td><xsl:value-of select="CbrtImc"/></td>
		<td><xsl:value-of select="CbrtBden"/></td>
		<td><xsl:value-of select="CbrtDDen"/></td>
		<td><xsl:value-of select="CbrtSwel"/></td>
		<td><xsl:value-of select="CbrtSkdt"/></td>
		<td><xsl:value-of select="CbrtSwel"/></td>
		<td><xsl:value-of select="CbrtRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Cdia">
	<tr>
	<td><xsl:value-of select="HoleId"/></td>
	<td><xsl:value-of select="CdiaDpth"/></td>
	<td><xsl:value-of select="CdiaDiam"/></td>
	<td><xsl:value-of select="CdiaRem"/></td>
	<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Chis">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="ChisFrom"/></td>
		<td><xsl:value-of select="ChisTo"/></td>
		<td><xsl:value-of select="ChisTime"/></td>
		<td><xsl:value-of select="ChisStar"/></td>
		<td><xsl:value-of select="ChisTool"/></td>
		<td><xsl:value-of select="ChisRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Choc">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="ChocRef"/></td>
		<td><xsl:value-of select="ChocFrom"/></td>
		<td><xsl:value-of select="ChocTo"/></td>
		<td><xsl:value-of select="ChocDdis"/></td>
		<td><xsl:value-of select="ChocBtch"/></td>
		<td><xsl:value-of select="ChocRem"/></td>
		<td><xsl:value-of select="ChocCont"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Cmpg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="CmpgTesn"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="CmpgType"/></td>
		<td><xsl:value-of select="CmpgMold"/></td>
		<td><xsl:value-of select="CMPG375"/></td>
		<td><xsl:value-of select="Cmpg200"/></td>
		<td><xsl:value-of select="CmpgPden"/></td>
		<td><xsl:value-of select="CmpgMaxD"/></td>
		<td><xsl:value-of select="CmpgMCop"/></td>
		<td><xsl:value-of select="CmpgStab"/></td>
		<td><xsl:value-of select="CmpgStyp"/></td>
		<td><xsl:value-of select="CmpgRem"/></td>
		<td><xsl:value-of select="CmpgMeth"/></td>
		<td><xsl:value-of select="CmpgLab"/></td>
		<td><xsl:value-of select="CmpgCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Cmpt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="CmpgTesn"/></td>
		<td><xsl:value-of select="CmptTesn"/></td>
		<td><xsl:value-of select="CmptMC"/></td>
		<td><xsl:value-of select="CmptDDen"/></td>
		<td><xsl:value-of select="CmptRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Cong">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="CongType"/></td>
		<td><xsl:value-of select="CongCond"/></td>
		<td><xsl:value-of select="CongDia"/></td>
		<td><xsl:value-of select="CongHigt"/></td>
		<td><xsl:value-of select="CongMCI"/></td>
		<td><xsl:value-of select="CongMCF"/></td>
		<td><xsl:value-of select="CongBden"/></td>
		<td><xsl:value-of select="CongDden"/></td>
		<td><xsl:value-of select="CongPden"/></td>
		<td><xsl:value-of select="CongSatr"/></td>
		<td><xsl:value-of select="CongSprs"/></td>
		<td><xsl:value-of select="CongSath"/></td>
		<td><xsl:value-of select="CongIvr"/></td>
		<td><xsl:value-of select="CongRem"/></td>
		<td><xsl:value-of select="CongMeth"/></td>
		<td><xsl:value-of select="CongLab"/></td>
		<td><xsl:value-of select="CongCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
		<td><xsl:value-of select="CongIncM"/></td>
		<td><xsl:value-of select="CongIncD"/></td>
	</tr>
</xsl:template>

<xsl:template match="Cons">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="ConsIncn"/></td>
		<td><xsl:value-of select="ConsIvr"/></td>
		<td><xsl:value-of select="ConsIncf"/></td>
		<td><xsl:value-of select="ConsInce"/></td>
		<td><xsl:value-of select="ConsInMv"/></td>
		<td><xsl:value-of select="ConsInSc"/></td>
		<td><xsl:value-of select="ConsCvRt"/></td>
		<td><xsl:value-of select="CongCvLg"/></td>
		<td><xsl:value-of select="ConsTemp"/></td>
		<td><xsl:value-of select="ConsRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
		<td><xsl:value-of select="ConsCC"/></td>
		<td><xsl:value-of select="ConsCS"/></td>
		<td><xsl:value-of select="ConsPOP"/></td>
	</tr>
</xsl:template>

<xsl:template match="Core">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="CoreTop"/></td>
		<td><xsl:value-of select="CoreBot"/></td>
		<td><xsl:value-of select="CorePrec"/></td>
		<td><xsl:value-of select="CoreSrec"/></td>
		<td><xsl:value-of select="CoreRqd"/></td>
		<td><xsl:value-of select="CoreDiam"/></td>
		<td><xsl:value-of select="CoreDiam"/></td>
		<td><xsl:value-of select="CoreRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Dcpg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="DcpgDate"/></td>
		<td><xsl:value-of select="DcpgTest"/></td>
		<td><xsl:value-of select="DcpgDpth"/></td>
		<td><xsl:value-of select="DcpgZero"/></td>
		<td><xsl:value-of select="DcpgLrem"/></td>
		<td><xsl:value-of select="DcpgRem"/></td>
		<td><xsl:value-of select="DcpgEnv"/></td>
		<td><xsl:value-of select="DcpgMeth"/></td>
		<td><xsl:value-of select="DcpgCont"/></td>
		<td><xsl:value-of select="DcpgCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Dcpt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="DcpgDate"/></td>
		<td><xsl:value-of select="DcpgTest"/></td>
		<td><xsl:value-of select="DcpgDpth"/></td>
		<td><xsl:value-of select="DcptCblo"/></td>
		<td><xsl:value-of select="DcptPen"/></td>
		<td><xsl:value-of select="DcptDel"/></td>
		<td><xsl:value-of select="DcptRem"/></td>
	</tr>
</xsl:template>

<xsl:template match="Detl">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="DetlTop"/></td>
		<td><xsl:value-of select="DetlBase"/></td>
		<td><xsl:value-of select="DetlDesc"/></td>
		<td><xsl:value-of select="DetlRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Disc">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="DiscTop"/></td>
		<td><xsl:value-of select="DiscBase"/></td>
		<td><xsl:value-of select="FracSet"/></td>
		<td><xsl:value-of select="DiscNumb"/></td>
		<td><xsl:value-of select="DiscType"/></td>
		<td><xsl:value-of select="DiscDip"/></td>
		<td><xsl:value-of select="DiscDir"/></td>
		<td><xsl:value-of select="DiscRgh"/></td>
		<td><xsl:value-of select="DiscPlan"/></td>
		<td><xsl:value-of select="DiscWave"/></td>
		<td><xsl:value-of select="DiscAmp"/></td>
		<td><xsl:value-of select="DiscJRC"/></td>
		<td><xsl:value-of select="DiscApp"/></td>
		<td><xsl:value-of select="DiscApt"/></td>
		<td><xsl:value-of select="DiscApOb"/></td>
		<td><xsl:value-of select="DiscInfM"/></td>
		<td><xsl:value-of select="DiscTerm"/></td>
		<td><xsl:value-of select="DiscPers"/></td>
		<td><xsl:value-of select="DiscStr"/></td>
		<td><xsl:value-of select="DiscWeth"/></td>
		<td><xsl:value-of select="DiscSeep"/></td>
		<td><xsl:value-of select="DiscFlow"/></td>
		<td><xsl:value-of select="DiscRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Dobs">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="DobsTop"/></td>
		<td><xsl:value-of select="DobsBase"/></td>
		<td><xsl:value-of select="DobsSet"/></td>
		<td><xsl:value-of select="DobsDurn"/></td>
		<td><xsl:value-of select="DobsStim"/></td>
		<td><xsl:value-of select="DobsEtim"/></td>
		<td><xsl:value-of select="DobsDhrt"/></td>
		<td><xsl:value-of select="DobsDhrs"/></td>
		<td><xsl:value-of select="DobsPenr"/></td>
		<td><xsl:value-of select="DobsHamm"/></td>
		<td><xsl:value-of select="DobsThrp"/></td>
		<td><xsl:value-of select="DobsResp"/></td>
		<td><xsl:value-of select="DobsTorp"/></td>
		<td><xsl:value-of select="DobsTorq"/></td>
		<td><xsl:value-of select="DobsThst"/></td>
		<td><xsl:value-of select="DobsRest"/></td>
		<td><xsl:value-of select="DobsHamp"/></td>
		<td><xsl:value-of select="DobsSpen"/></td>
		<td><xsl:value-of select="DobsFmpo"/></td>
		<td><xsl:value-of select="DobsFmcr"/></td>
		<td><xsl:value-of select="DobsFmrr"/></td>
		<td><xsl:value-of select="DobsRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Dprb">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="DprbDpth"/></td>
		<td><xsl:value-of select="DprbBlow"/></td>
		<td><xsl:value-of select="DprbCblw"/></td>
		<td><xsl:value-of select="DprbTorq"/></td>
		<td><xsl:value-of select="DprbDel"/></td>
		<td><xsl:value-of select="DprbInc"/></td>
		<td><xsl:value-of select="DprbRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Drpg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="DprgType"/></td>
		<td><xsl:value-of select="DprgTest"/></td>
		<td><xsl:value-of select="DprgMass"/></td>
		<td><xsl:value-of select="DprgDrop"/></td>
		<td><xsl:value-of select="DprgCone"/></td>
		<td><xsl:value-of select="DprgRod"/></td>
		<td><xsl:value-of select="DprgDamp"/></td>
		<td><xsl:value-of select="DprgTip"/></td>
		<td><xsl:value-of select="DprgRem"/></td>
		<td><xsl:value-of select="DprgAng"/></td>
		<td><xsl:value-of select="DprgRMss"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Drem">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="DremTop"/></td>
		<td><xsl:value-of select="DremBase"/></td>
		<td><xsl:value-of select="DremRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Eres">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="EresCode"/></td>
		<td><xsl:value-of select="EresMeth"/></td>
		<td><xsl:value-of select="EresMatx"/></td>
		<td><xsl:value-of select="EresRtype"/></td>
		<td><xsl:value-of select="EresTesn"/></td>
		<td><xsl:value-of select="EresName"/></td>
		<td><xsl:value-of select="EresTnam"/></td>
		<td><xsl:value-of select="EresRval"/></td>
		<td><xsl:value-of select="EresRuni"/></td>
		<td><xsl:value-of select="EresRtxt"/></td>
		<td><xsl:value-of select="EresRtcd"/></td>
		<td><xsl:value-of select="EresRtcd"/></td>
		<td><xsl:value-of select="EresDetf"/></td>
		<td><xsl:value-of select="EresOrg"/></td>
		<td><xsl:value-of select="EresIqlf"/></td>
		<td><xsl:value-of select="EresLqlf"/></td>
		<td><xsl:value-of select="EresRdlm"/></td>
		<td><xsl:value-of select="EresMdlm"/></td>
		<td><xsl:value-of select="EresQlm"/></td>
		<td><xsl:value-of select="EresDuni"/></td>
		<td><xsl:value-of select="EresTicp"/></td>
		<td><xsl:value-of select="EresTict"/></td>
		<td><xsl:value-of select="EresRdat"/></td>
		<td><xsl:value-of select="EresSgrp"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="EresDtim"/></td>
		<td><xsl:value-of select="EresTest"/></td>
		<td><xsl:value-of select="EresTord"/></td>
		<td><xsl:value-of select="EresLocn"/></td>
		<td><xsl:value-of select="EresBas"/></td>
		<td><xsl:value-of select="EresDil"/></td>
		<td><xsl:value-of select="EresLmth"/></td>
		<td><xsl:value-of select="EresLdtm"/></td>
		<td><xsl:value-of select="EresIref"/></td>
		<td><xsl:value-of select="EresIref"/></td>
		<td><xsl:value-of select="EresPerp"/></td>
		<td><xsl:value-of select="EresRem"/></td>
		<td><xsl:value-of select="EresLab"/></td>
		<td><xsl:value-of select="EresCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Escg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="EscgType"/></td>
		<td><xsl:value-of select="EscgCell"/></td>
		<td><xsl:value-of select="EscgCond"/></td>
		<td><xsl:value-of select="EscgDia"/></td>
		<td><xsl:value-of select="EscgHigt"/></td>
		<td><xsl:value-of select="EscgMCI"/></td>
		<td><xsl:value-of select="EscgMCF"/></td>
		<td><xsl:value-of select="EscgBden"/></td>
		<td><xsl:value-of select="EscgDden"/></td>
		<td><xsl:value-of select="EscgPden"/></td>
		<td><xsl:value-of select="EscgIvr"/></td>
		<td><xsl:value-of select="EscgSatr"/></td>
		<td><xsl:value-of select="EscgLoad"/></td>
		<td><xsl:value-of select="EscgDrag"/></td>
		<td><xsl:value-of select="EscgPpm"/></td>
		<td><xsl:value-of select="EscgSprs"/></td>
		<td><xsl:value-of select="EscgSatm"/></td>
		<td><xsl:value-of select="EscgSinc"/></td>
		<td><xsl:value-of select="EscgSdif"/></td>
		<td><xsl:value-of select="EscgCelf"/></td>
		<td><xsl:value-of select="EscgBacf"/></td>
		<td><xsl:value-of select="EscgBval"/></td>
		<td><xsl:value-of select="EscgSvol"/></td>
		<td><xsl:value-of select="EscgRem"/></td>
		<td><xsl:value-of select="EscgMeth"/></td>
		<td><xsl:value-of select="EscgLab"/></td>
		<td><xsl:value-of select="EscgCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Esct">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="EsctIncN"/></td>
		<td><xsl:value-of select="EsctRem"/></td>
		<td><xsl:value-of select="EsctIncc"/></td>
		<td><xsl:value-of select="EsctIncb"/></td>
		<td><xsl:value-of select="EsctPwp0"/></td>
		<td><xsl:value-of select="EsctPwpf"/></td>
		<td><xsl:value-of select="EsctIncf"/></td>
		<td><xsl:value-of select="EsctVr0"/></td>
		<td><xsl:value-of select="EsctVre"/></td>
		<td><xsl:value-of select="EsctDiss"/></td>
		<td><xsl:value-of select="EsctDset"/></td>
		<td><xsl:value-of select="EsctDvol"/></td>
		<td><xsl:value-of select="EsctInmv"/></td>
		<td><xsl:value-of select="EsctIncv"/></td>
		<td><xsl:value-of select="EsctInsc"/></td>
		<td><xsl:value-of select="EsctCvMe"/></td>
		<td><xsl:value-of select="EsctTemp"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Flsh">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="FlshTop"/></td>
		<td><xsl:value-of select="FlshBase"/></td>
		<td><xsl:value-of select="FlshType"/></td>
		<td><xsl:value-of select="FlshRetn"/></td>
		<td><xsl:value-of select="FlshRetx"/></td>
		<td><xsl:value-of select="FlshCol"/></td>
		<td><xsl:value-of select="FlshRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Frac">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="FracTop"/></td>
		<td><xsl:value-of select="FracBase"/></td>
		<td><xsl:value-of select="FracSet"/></td>
		<td><xsl:value-of select="FracFi"/></td>
		<td><xsl:value-of select="FracIMax"/></td>
		<td><xsl:value-of select="FracIAve"/></td>
		<td><xsl:value-of select="FracIMin"/></td>
		<td><xsl:value-of select="FracRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Frst">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="FrstCond"/></td>
		<td><xsl:value-of select="FrstDDen"/></td>
		<td><xsl:value-of select="FrstMC"/></td>
		<td><xsl:value-of select="FrstHve1"/></td>
		<td><xsl:value-of select="FrstHve2"/></td>
		<td><xsl:value-of select="FrstHve3"/></td>
		<td><xsl:value-of select="FrstHve"/></td>
		<td><xsl:value-of select="FrstStab"/></td>
		<td><xsl:value-of select="FrstStyp"/></td>
		<td><xsl:value-of select="FrstRem"/></td>
		<td><xsl:value-of select="FrstMeth"/></td>
		<td><xsl:value-of select="FrstLab"/></td>
		<td><xsl:value-of select="FrstCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Gchm">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="GchmType"/></td>
		<td><xsl:value-of select="GchmMeth"/></td>
		<td><xsl:value-of select="GchmTtyp"/></td>
		<td><xsl:value-of select="Gchm_Resl"/></td>
		<td><xsl:value-of select="GchmUnit"/></td>
		<td><xsl:value-of select="GchmName"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="GchmRem"/></td>
		<td><xsl:value-of select="GchmLab"/></td>
		<td><xsl:value-of select="GchmCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Geol">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="GeolTop"/></td>
		<td><xsl:value-of select="GeolBase"/></td>
		<td><xsl:value-of select="GeolDesc"/></td>
		<td><xsl:value-of select="GeolLeg"/></td>
		<td><xsl:value-of select="GeolGeol"/></td>
		<td><xsl:value-of select="GeolGeo2"/></td>
		<td><xsl:value-of select="GeolStat"/></td>
		<td><xsl:value-of select="GeolBgs"/></td>
		<td><xsl:value-of select="GeolForm"/></td>
		<td><xsl:value-of select="GeolRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Grag">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="GradUc"/></td>
		<td><xsl:value-of select="GragVcre"/></td>
		<td><xsl:value-of select="GragGrav"/></td>
		<td><xsl:value-of select="GragSand"/></td>
		<td><xsl:value-of select="GragSilt"/></td>
		<td><xsl:value-of select="GragClay"/></td>
		<td><xsl:value-of select="GragFine"/></td>
		<td><xsl:value-of select="GragRem"/></td>
		<td><xsl:value-of select="GragMeth"/></td>
		<td><xsl:value-of select="GragLab"/></td>
		<td><xsl:value-of select="GragCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Grat">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="GratSize"/></td>
		<td><xsl:value-of select="GratPerP"/></td>
		<td><xsl:value-of select="GratType"/></td>
		<td><xsl:value-of select="GratRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Hdia">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="HDiaDpth"/></td>
		<td><xsl:value-of select="HDiaDia"/></td>
		<td><xsl:value-of select="HDiaRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Hdph">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="HdphTop"/></td>
		<td><xsl:value-of select="HdphBase"/></td>
		<td><xsl:value-of select="HdphType"/></td>
		<td><xsl:value-of select="HdphStar"/></td>
		<td><xsl:value-of select="HdphEndD"/></td>
		<td><xsl:value-of select="HdphCrew"/></td>
		<td><xsl:value-of select="HdphExc"/></td>
		<td><xsl:value-of select="HdphShor"/></td>
		<td><xsl:value-of select="HdphStab"/></td>
		<td><xsl:value-of select="HdphDiml"/></td>
		<td><xsl:value-of select="HdphDimw"/></td>
		<td><xsl:value-of select="HdphDbit"/></td>
		<td><xsl:value-of select="HdphBCon"/></td>
		<td><xsl:value-of select="HdphBTyp"/></td>
		<td><xsl:value-of select="HdphBLen"/></td>
		<td><xsl:value-of select="HdphLog"/></td>
		<td><xsl:value-of select="HdphLogD"/></td>
		<td><xsl:value-of select="HDphRem"/></td>
		<td><xsl:value-of select="HdphEnv"/></td>
		<td><xsl:value-of select="HdphMeth"/></td>
		<td><xsl:value-of select="HdphCont"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Horn">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="HornTop"/></td>
		<td><xsl:value-of select="HornBase"/></td>
		<td><xsl:value-of select="HornOrnt"/></td>
		<td><xsl:value-of select="HornIncl"/></td>
		<td><xsl:value-of select="HornRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Icbr">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IcbrDpth"/></td>
		<td><xsl:value-of select="IcbrTesN"/></td>
		<td><xsl:value-of select="IcbrIcbr"/></td>
		<td><xsl:value-of select="IcbrDate"/></td>
		<td><xsl:value-of select="IcbrRem"/></td>
		<td><xsl:value-of select="IcbrSeat"/></td>
		<td><xsl:value-of select="IcbrSurc"/></td>
		<td><xsl:value-of select="IcbrType"/></td>
		<td><xsl:value-of select="IcbrRem"/></td>
		<td><xsl:value-of select="IcbrEnv"/></td>
		<td><xsl:value-of select="IcbrMeth"/></td>
		<td><xsl:value-of select="IcbrCont"/></td>
		<td><xsl:value-of select="IcbrCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="GeolStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Iden">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IdenDpth"/></td>
		<td><xsl:value-of select="IdenTesN"/></td>
		<td><xsl:value-of select="IdenDate"/></td>
		<td><xsl:value-of select="IdenType"/></td>
		<td><xsl:value-of select="IdenIden"/></td>
		<td><xsl:value-of select="IdenMC"/></td>
		<td><xsl:value-of select="IdenStab"/></td>
		<td><xsl:value-of select="IdenStyp"/></td>
		<td><xsl:value-of select="IdenRem"/></td>
		<td><xsl:value-of select="IcbrEnv"/></td>
		<td><xsl:value-of select="IdenMeth"/></td>
		<td><xsl:value-of select="IdenCont"/></td>
		<td><xsl:value-of select="IdenCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="GeolStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Ifid">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IfidDpth"/></td>
		<td><xsl:value-of select="IfIdTesN"/></td>
		<td><xsl:value-of select="IfIdDate"/></td>
		<td><xsl:value-of select="IfIdRes"/></td>
		<td><xsl:value-of select="IfidRem"/></td>
		<td><xsl:value-of select="IfidEnv"/></td>
		<td><xsl:value-of select="IfidMeth"/></td>
		<td><xsl:value-of select="IfidCont"/></td>
		<td><xsl:value-of select="IfidCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="GeolStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Ipen">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IfidDpth"/></td>
		<td><xsl:value-of select="IfIdTesN"/></td>
		<td><xsl:value-of select="IpenIpen"/></td>
		<td><xsl:value-of select="IfIdDate"/></td>
		<td><xsl:value-of select="IpenRem"/></td>
		<td><xsl:value-of select="IPenEnv"/></td>
		<td><xsl:value-of select="IpenMeth"/></td>
		<td><xsl:value-of select="IpenCont"/></td>
		<td><xsl:value-of select="IpenCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="GeolStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Ipid">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IpidDpth"/></td>
		<td><xsl:value-of select="IpIdTesN"/></td>
		<td><xsl:value-of select="IpidDate"/></td>
		<td><xsl:value-of select="IpidTemp"/></td>
		<td><xsl:value-of select="IpIdRes"/></td>
		<td><xsl:value-of select="IpIdRem"/></td>
		<td><xsl:value-of select="IpidEnv"/></td>
		<td><xsl:value-of select="IpidMeth"/></td>
		<td><xsl:value-of select="IpidCont"/></td>
		<td><xsl:value-of select="IpidCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="GeolStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Iprg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IprgTop"/></td>
		<td><xsl:value-of select="IprgTesN"/></td>
		<td><xsl:value-of select="IprgBase"/></td>
		<td><xsl:value-of select="IprgStg"/></td>
		<td><xsl:value-of select="IprgType"/></td>
		<td><xsl:value-of select="IprgPrwl"/></td>
		<td><xsl:value-of select="IprgSwal"/></td>
		<td><xsl:value-of select="IprgTdia"/></td>
		<td><xsl:value-of select="IprgSdia"/></td>
		<td><xsl:value-of select="IprgIprm"/></td>
		<td><xsl:value-of select="IprgFlow"/></td>
		<td><xsl:value-of select="IprgAwl"/></td>
		<td><xsl:value-of select="IprgHead"/></td>
		<td><xsl:value-of select="IprgDate"/></td>
		<td><xsl:value-of select="IprgRem"/></td>
		<td><xsl:value-of select="IprgEnv"/></td>
		<td><xsl:value-of select="IprgMeth"/></td>
		<td><xsl:value-of select="IprgCont"/></td>
		<td><xsl:value-of select="IprgCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Iprt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IprgTop"/></td>
		<td><xsl:value-of select="IprgTesN"/></td>
		<td><xsl:value-of select="IprgBase"/></td>
		<td><xsl:value-of select="IprgStg"/></td>
		<td><xsl:value-of select="IprtTime"/></td>
		<td><xsl:value-of select="IprtDpth"/></td>
		<td><xsl:value-of select="IprtRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Irdx">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IrdxDpth"/></td>
		<td><xsl:value-of select="IrdxTesN"/></td>
		<td><xsl:value-of select="IrdxDate"/></td>
		<td><xsl:value-of select="IrdxPh"/></td>
		<td><xsl:value-of select="IrdxMpot"/></td>
		<td><xsl:value-of select="IrdxIrdx"/></td>
		<td><xsl:value-of select="IrdxRem"/></td>
		<td><xsl:value-of select="IrdxEnv"/></td>
		<td><xsl:value-of select="IrdxMeth"/></td>
		<td><xsl:value-of select="IrdxCont"/></td>
		<td><xsl:value-of select="IrdxCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="GeolStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Ires">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IresDpth"/></td>
		<td><xsl:value-of select="IresTesN"/></td>
		<td><xsl:value-of select="IresBase"/></td>
		<td><xsl:value-of select="IresType"/></td>
		<td><xsl:value-of select="IresDate"/></td>
		<td><xsl:value-of select="IresIres"/></td>
		<td><xsl:value-of select="IresIres1"/></td>
		<td><xsl:value-of select="IresIres2"/></td>
		<td><xsl:value-of select="IresRem"/></td>
		<td><xsl:value-of select="IresEnv"/></td>
		<td><xsl:value-of select="IresMeth"/></td>
		<td><xsl:value-of select="IresCont"/></td>
		<td><xsl:value-of select="IresCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="GeolStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Isag">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IsagTesN"/></td>
		<td><xsl:value-of select="IresDate"/></td>
		<td><xsl:value-of select="IsagDurn"/></td>
		<td><xsl:value-of select="IsagPwid"/></td>
		<td><xsl:value-of select="IsagPlin"/></td>
		<td><xsl:value-of select="IsagPdia"/></td>
		<td><xsl:value-of select="IsagDpts"/></td>
		<td><xsl:value-of select="IsagDptE"/></td>
		<td><xsl:value-of select="IsagCons"/></td>
		<td><xsl:value-of select="IsagSi"/></td>
		<td><xsl:value-of select="IsagPoro"/></td>
		<td><xsl:value-of select="IsagRem"/></td>
		<td><xsl:value-of select="IsagEnv"/></td>
		<td><xsl:value-of select="IsagMeth"/></td>
		<td><xsl:value-of select="IsagCont"/></td>
		<td><xsl:value-of select="IsagCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Isat">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IsagTesN"/></td>
		<td><xsl:value-of select="IsatTime"/></td>
		<td><xsl:value-of select="IsatDpth"/></td>
		<td><xsl:value-of select="IsatRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Ispt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IsptTop"/></td>
		<td><xsl:value-of select="IsptSeat"/></td>
		<td><xsl:value-of select="IsptMain"/></td>
		<td><xsl:value-of select="IsptNpen"/></td>
		<td><xsl:value-of select="IsptNval"/></td>
		<td><xsl:value-of select="IsptRep"/></td>
		<td><xsl:value-of select="IsptCas"/></td>
		<td><xsl:value-of select="IsptWat"/></td>
		<td><xsl:value-of select="IsptType"/></td>
		<td><xsl:value-of select="IsptHam"/></td>
		<td><xsl:value-of select="IsptErat"/></td>
		<td><xsl:value-of select="IsptSwp"/></td>
		<td><xsl:value-of select="IsptInc1"/></td>
		<td><xsl:value-of select="IsptInc2"/></td>
		<td><xsl:value-of select="IsptInc3"/></td>
		<td><xsl:value-of select="IsptInc4"/></td>
		<td><xsl:value-of select="IsptInc5"/></td>
		<td><xsl:value-of select="IsptInc6"/></td>
		<td><xsl:value-of select="IsptPen1"/></td>
		<td><xsl:value-of select="IsptPen2"/></td>
		<td><xsl:value-of select="IsptPen3"/></td>
		<td><xsl:value-of select="IsptPen4"/></td>
		<td><xsl:value-of select="IsptPen5"/></td>
		<td><xsl:value-of select="IsptPen6"/></td>
		<td><xsl:value-of select="IsptRock"/></td>
		<td><xsl:value-of select="IsptRem"/></td>
		<td><xsl:value-of select="IsptEnv"/></td>
		<td><xsl:value-of select="IsptMeth"/></td>
		<td><xsl:value-of select="IsptCont"/></td>
		<td><xsl:value-of select="IsptCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Ivan">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="IvanDpth"/></td>
		<td><xsl:value-of select="IvanTesN"/></td>
		<td><xsl:value-of select="IvanType"/></td>
		<td><xsl:value-of select="IvanIvan"/></td>
		<td><xsl:value-of select="IvanIvar"/></td>
		<td><xsl:value-of select="IvanDate"/></td>
		<td><xsl:value-of select="IvanRem"/></td>
		<td><xsl:value-of select="IvanEnv"/></td>
		<td><xsl:value-of select="IvanMeth"/></td>
		<td><xsl:value-of select="IvanCont"/></td>
		<td><xsl:value-of select="IvanCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="GeolStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Lden">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="LdenType"/></td>
		<td><xsl:value-of select="LdenCond"/></td>
		<td><xsl:value-of select="LdenSmty"/></td>
		<td><xsl:value-of select="LdenMC"/></td>
		<td><xsl:value-of select="LdenBden"/></td>
		<td><xsl:value-of select="LdenDden"/></td>
		<td><xsl:value-of select="LdenRem"/></td>
		<td><xsl:value-of select="LdenMeth"/></td>
		<td><xsl:value-of select="LdenLab"/></td>
		<td><xsl:value-of select="LdenCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Ldyn">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="LdynPwave"/></td>
		<td><xsl:value-of select="LdynSwave"/></td>
		<td><xsl:value-of select="LdynEmod"/></td>
		<td><xsl:value-of select="LdynSg"/></td>
		<td><xsl:value-of select="LdynRem"/></td>
		<td><xsl:value-of select="LdynMeth"/></td>
		<td><xsl:value-of select="LdynLab"/></td>
		<td><xsl:value-of select="LdynCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Llin">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="LlinLs"/></td>
		<td><xsl:value-of select="Llin425"/></td>
		<td><xsl:value-of select="LlinPrep"/></td>
		<td><xsl:value-of select="LlinRem"/></td>
		<td><xsl:value-of select="LlinMeth"/></td>
		<td><xsl:value-of select="LlinLab"/></td>
		<td><xsl:value-of select="LlinCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Llpl">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="LlplLl"/></td>
		<td><xsl:value-of select="LlplPl"/></td>
		<td><xsl:value-of select="LlplPi"/></td>
		<td><xsl:value-of select="Llpl425"/></td>
		<td><xsl:value-of select="LlplPrep"/></td>
		<td><xsl:value-of select="LlplStab"/></td>
		<td><xsl:value-of select="LlplStyp"/></td>
		<td><xsl:value-of select="LlplRem"/></td>
		<td><xsl:value-of select="LlplMeth"/></td>
		<td><xsl:value-of select="LlplLab"/></td>
		<td><xsl:value-of select="LlplCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Lnmc">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="LnmcMc"/></td>
		<td><xsl:value-of select="LnmcTemp"/></td>
		<td><xsl:value-of select="LnMcStab"/></td>
		<td><xsl:value-of select="LnMcStyp"/></td>
		<td><xsl:value-of select="LnmcRem"/></td>
		<td><xsl:value-of select="LnMcMeth"/></td>
		<td><xsl:value-of select="LnMcLab"/></td>
		<td><xsl:value-of select="LnMcCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Loca">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="HoleType"/></td>
		<td><xsl:value-of select="HoleStat"/></td>
		<td><xsl:value-of select="HoleNatE"/></td>
		<td><xsl:value-of select="HoleNatN"/></td>
		<td><xsl:value-of select="HoleGref"/></td>
		<td><xsl:value-of select="HoleGL"/></td>
		<td><xsl:value-of select="HoleRem"/></td>
		<td><xsl:value-of select="HoleFDep"/></td>
		<td><xsl:value-of select="HoleStar"/></td>
		<td><xsl:value-of select="HolePurp"/></td>
		<td><xsl:value-of select="HoleTerm"/></td>
		<td><xsl:value-of select="HoleEndD"/></td>
		<td><xsl:value-of select="HoleLett"/></td>
		<td><xsl:value-of select="HoleLocX"/></td>
		<td><xsl:value-of select="HoleLocY"/></td>
		<td><xsl:value-of select="HoleLocZ"/></td>
		<td><xsl:value-of select="HoleDatm"/></td>
		<td><xsl:value-of select="HoleLRef"/></td>
		<td><xsl:value-of select="HoleEtrv"/></td>
		<td><xsl:value-of select="HoleNtrv"/></td>
		<td><xsl:value-of select="HoleLtrv"/></td>
		<td><xsl:value-of select="HoleXtrl"/></td>
		<td><xsl:value-of select="HoleYtrl"/></td>
		<td><xsl:value-of select="HoleZtrl"/></td>
		<td><xsl:value-of select="HoleLat"/></td>
		<td><xsl:value-of select="HoleLong"/></td>
		<td><xsl:value-of select="HoleElat"/></td>
		<td><xsl:value-of select="HoleElon"/></td>
		<td><xsl:value-of select="HoleLlz"/></td>
		<td><xsl:value-of select="HoleLocm"/></td>
		<td><xsl:value-of select="HoleLoca"/></td>
		<td><xsl:value-of select="HoleClst"/></td>
		<td><xsl:value-of select="HoleAlID"/></td>
		<td><xsl:value-of select="HoleOffs"/></td>
		<td><xsl:value-of select="HoleCnge"/></td>
		<td><xsl:value-of select="HoleTran"/></td>
		<td><xsl:value-of select="FileFset"/></td>
		<td><xsl:value-of select="HoleNatD"/></td>
		<td><xsl:value-of select="HoleOrid"/></td>
		<td><xsl:value-of select="HoleOrJo"/></td>
		<td><xsl:value-of select="HoleOrCo"/></td>
	</tr>
</xsl:template>

<xsl:template match="Lpdn">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="LpdnPden"/></td>
		<td><xsl:value-of select="LpdnType"/></td>
		<td><xsl:value-of select="LpdnRem"/></td>
		<td><xsl:value-of select="LpdnMeth"/></td>
		<td><xsl:value-of select="LpdnLab"/></td>
		<td><xsl:value-of select="LpdnCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Lpen">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="LpdnPPen"/></td>
		<td><xsl:value-of select="LpenMc"/></td>
		<td><xsl:value-of select="LpenRem"/></td>
		<td><xsl:value-of select="LpenMeth"/></td>
		<td><xsl:value-of select="LpenLab"/></td>
		<td><xsl:value-of select="LpenCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Lres">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="LresBden"/></td>
		<td><xsl:value-of select="LresDden"/></td>
		<td><xsl:value-of select="LresMc"/></td>
		<td><xsl:value-of select="LresCond"/></td>
		<td><xsl:value-of select="LresRes"/></td>
		<td><xsl:value-of select="LresCdia"/></td>
		<td><xsl:value-of select="LresCcsa"/></td>
		<td><xsl:value-of select="LresClen"/></td>
		<td><xsl:value-of select="LresTemp"/></td>
		<td><xsl:value-of select="LresElec"/></td>
		<td><xsl:value-of select="LresPent"/></td>
		<td><xsl:value-of select="LresCshp"/></td>
		<td><xsl:value-of select="LresWat"/></td>
		<td><xsl:value-of select="LresWRes"/></td>
		<td><xsl:value-of select="LresPart"/></td>
		<td><xsl:value-of select="LresRem"/></td>
		<td><xsl:value-of select="LresMeth"/></td>
		<td><xsl:value-of select="LresLab"/></td>
		<td><xsl:value-of select="LresCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Lslt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="LresSlim"/></td>
		<td><xsl:value-of select="LsltShra"/></td>
		<td><xsl:value-of select="LsltIden"/></td>
		<td><xsl:value-of select="LsltMci"/></td>
		<td><xsl:value-of select="Lslt425"/></td>
		<td><xsl:value-of select="LsltRem"/></td>
		<td><xsl:value-of select="LsltMeth"/></td>
		<td><xsl:value-of select="LsltLab"/></td>
		<td><xsl:value-of select="LresCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Lstg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="LstgIcl"/></td>
		<td><xsl:value-of select="LstgPh"/></td>
		<td><xsl:value-of select="LstgLime"/></td>
		<td><xsl:value-of select="LstgSuit"/></td>
		<td><xsl:value-of select="Lstg425"/></td>
		<td><xsl:value-of select="LstgRem"/></td>
		<td><xsl:value-of select="LstgMeth"/></td>
		<td><xsl:value-of select="LstgLab"/></td>
		<td><xsl:value-of select="LstgCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Lstt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="LsttTesn"/></td>
		<td><xsl:value-of select="LsttLcon"/></td>
		<td><xsl:value-of select="LsttPh"/></td>
		<td><xsl:value-of select="LsttRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Lswl">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="LswlSwpr"/></td>
		<td><xsl:value-of select="LswlSwsi"/></td>
		<td><xsl:value-of select="LswlMci"/></td>
		<td><xsl:value-of select="LswlSdia"/></td>
		<td><xsl:value-of select="LswlThck"/></td>
		<td><xsl:value-of select="LswlBden"/></td>
		<td><xsl:value-of select="LswlDden"/></td>
		<td><xsl:value-of select="LswlRem"/></td>
		<td><xsl:value-of select="LswlMeth"/></td>
		<td><xsl:value-of select="LswlLab"/></td>
		<td><xsl:value-of select="LswlCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Lvan">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="LvanVnpk"/></td>
		<td><xsl:value-of select="LvanVnrm"/></td>
		<td><xsl:value-of select="LvanMc"/></td>
		<td><xsl:value-of select="LvanSize"/></td>
		<td><xsl:value-of select="LvanVlen"/></td>
		<td><xsl:value-of select="LvanRem"/></td>
		<td><xsl:value-of select="LvanMeth"/></td>
		<td><xsl:value-of select="LvanLab"/></td>
		<td><xsl:value-of select="LvanCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Mcvg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="Mcvg200"/></td>
		<td><xsl:value-of select="McvgNMC"/></td>
		<td><xsl:value-of select="McvgStab"/></td>
		<td><xsl:value-of select="McvgStyp"/></td>
		<td><xsl:value-of select="McvgRem"/></td>
		<td><xsl:value-of select="McvgMeth"/></td>
		<td><xsl:value-of select="McvgLab"/></td>
		<td><xsl:value-of select="McvgCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Mcvt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="McvtTesn"/></td>
		<td><xsl:value-of select="McvtMC"/></td>
		<td><xsl:value-of select="McvtCurv"/></td>
		<td><xsl:value-of select="McvtRelK"/></td>
		<td><xsl:value-of select="McvtBden"/></td>
		<td><xsl:value-of select="McvtDiff"/></td>
		<td><xsl:value-of select="McvtRapd"/></td>
		<td><xsl:value-of select="McvtRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Mond">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="MonpID"/></td>
		<td><xsl:value-of select="MondDis"/></td>
		<td><xsl:value-of select="MondDTime"/></td>
		<td><xsl:value-of select="MondType"/></td>
		<td><xsl:value-of select="MondRef"/></td>
		<td><xsl:value-of select="MondInst"/></td>
		<td><xsl:value-of select="MondRdng"/></td>
		<td><xsl:value-of select="MondUnit"/></td>
		<td><xsl:value-of select="MondMeth"/></td>
		<td><xsl:value-of select="MondLim"/></td>
		<td><xsl:value-of select="MondUlim"/></td>
		<td><xsl:value-of select="MondName"/></td>
		<td><xsl:value-of select="MondCred"/></td>
		<td><xsl:value-of select="MondCont"/></td>
		<td><xsl:value-of select="MondRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Mong">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="MongID"/></td>
		<td><xsl:value-of select="MongDis"/></td>
		<td><xsl:value-of select="PipeRef"/></td>
		<td><xsl:value-of select="MongDate"/></td>
		<td><xsl:value-of select="MongType"/></td>
		<td><xsl:value-of select="MongDetl"/></td>
		<td><xsl:value-of select="MongTrz"/></td>
		<td><xsl:value-of select="MongBrz"/></td>
		<td><xsl:value-of select="MongBrgA"/></td>
		<td><xsl:value-of select="MongBrgB"/></td>
		<td><xsl:value-of select="MongBrgC"/></td>
		<td><xsl:value-of select="MongIncA"/></td>
		<td><xsl:value-of select="MongIncB"/></td>
		<td><xsl:value-of select="MongIncC"/></td>
		<td><xsl:value-of select="MongRSCA"/></td>
		<td><xsl:value-of select="MongRSCB"/></td>
		<td><xsl:value-of select="MongRSCC"/></td>
		<td><xsl:value-of select="MongRem"/></td>
		<td><xsl:value-of select="MongCont"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Pipe">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="PipeRef"/></td>
		<td><xsl:value-of select="PIPE_TOP"/></td>
		<td><xsl:value-of select="PipeBase"/></td>
		<td><xsl:value-of select="PipeDiam"/></td>
		<td><xsl:value-of select="PipeType"/></td>
		<td><xsl:value-of select="PipeRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Pltg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="PltgDpth"/></td>
		<td><xsl:value-of select="PrefDate"/></td>
		<td><xsl:value-of select="PltgCyc"/></td>
		<td><xsl:value-of select="PLTG_PDIA"/></td>
		<td><xsl:value-of select="PltgSeat"/></td>
		<td><xsl:value-of select="PltgFa0"/></td>
		<td><xsl:value-of select="PltgFa1"/></td>
		<td><xsl:value-of select="PltgFa2"/></td>
		<td><xsl:value-of select="PltgSmod"/></td>
		<td><xsl:value-of select="PltgEv2"/></td>
		<td><xsl:value-of select="PltgMosr"/></td>
		<td><xsl:value-of select="PltgEmod"/></td>
		<td><xsl:value-of select="PltgDate"/></td>
		<td><xsl:value-of select="PltgStab"/></td>
		<td><xsl:value-of select="PltgStyp"/></td>
		<td><xsl:value-of select="PltgRem"/></td>
		<td><xsl:value-of select="PltgEnv"/></td>
		<td><xsl:value-of select="PltgMeth"/></td>
		<td><xsl:value-of select="PltgCont"/></td>
		<td><xsl:value-of select="PltgCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="GeolStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Pltt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="PlttDpth"/></td>
		<td><xsl:value-of select="PlttTesn"/></td>
		<td><xsl:value-of select="PlttCyc"/></td>
		<td><xsl:value-of select="PlttStg"/></td>
		<td><xsl:value-of select="PlttTime"/></td>
		<td><xsl:value-of select="PlttLoad"/></td>
		<td><xsl:value-of select="PlttSet1"/></td>
		<td><xsl:value-of select="PlttSet2"/></td>
		<td><xsl:value-of select="PlttSet3"/></td>
		<td><xsl:value-of select="PlttSet4"/></td>
		<td><xsl:value-of select="PlttRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Pmtd">
	<tr>
	<td><xsl:value-of select="HoleId"/></td>
	<td><xsl:value-of select="PmtgDpth"/></td>
	<td><xsl:value-of select="PmtgTesN"/></td>
	<td><xsl:value-of select="PmtdSeq"/></td>
	<td><xsl:value-of select="PmtdArm1"/></td>
	<td><xsl:value-of select="PmtdArm2"/></td>
	<td><xsl:value-of select="PmtdArm3"/></td>
	<td><xsl:value-of select="PmtdTpc"/></td>
	<td><xsl:value-of select="PmtdPpA"/></td>
	<td><xsl:value-of select="PmtdPpB"/></td>
	<td><xsl:value-of select="PmtdVol"/></td>
	<td><xsl:value-of select="PmtdRem"/></td>
	<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Pmtg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="PmtgDpth"/></td>
		<td><xsl:value-of select="PmtgTesN"/></td>
		<td><xsl:value-of select="PmtgDate"/></td>
		<td><xsl:value-of select="PmtgWat"/></td>
		<td><xsl:value-of select="PmtgCont"/></td>
		<td><xsl:value-of select="PmtgCrew"/></td>
		<td><xsl:value-of select="PmtgRef"/></td>
		<td><xsl:value-of select="PmtgType"/></td>
		<td><xsl:value-of select="PmtgDiam"/></td>
		<td><xsl:value-of select="PmtgHO"/></td>
		<td><xsl:value-of select="PmtgGI"/></td>
		<td><xsl:value-of select="PmtgCU"/></td>
		<td><xsl:value-of select="PmtgPL"/></td>
		<td><xsl:value-of select="PmtgAF"/></td>
		<td><xsl:value-of select="PmtgAD"/></td>
		<td><xsl:value-of select="PmtgAFCV"/></td>
		<td><xsl:value-of select="PmtgMeth"/></td>
		<td><xsl:value-of select="PmtgCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="PmtgEnv"/></td>
		<td><xsl:value-of select="PmtgRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Pmtl">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="PmtgDpth"/></td>
		<td><xsl:value-of select="PmtgTesN"/></td>
		<td><xsl:value-of select="PmtdSeq"/></td>
		<td><xsl:value-of select="PmtlLNo"/></td>
		<td><xsl:value-of select="PmtlGAA"/></td>
		<td><xsl:value-of select="PrtlSinc"/></td>
		<td><xsl:value-of select="PrtlPinc"/></td>
		<td><xsl:value-of select="PrtlStra"/></td>
		<td><xsl:value-of select="PrtlPrsa"/></td>
		<td><xsl:value-of select="PrtlNlsa"/></td>
		<td><xsl:value-of select="PrtlNlsb"/></td>
		<td><xsl:value-of select="PmtlRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Proj">
	<tr>
		<td><xsl:value-of select="ProjId"/></td>
		<td><xsl:value-of select="GintRecID"/></td>
		<td><xsl:value-of select="gINTProjectId"/></td>
		<td><xsl:value-of select="ProjName"/></td>
		<td><xsl:value-of select="ProjClnt"/></td>
		<td><xsl:value-of select="ProjCont"/></td>
		<td><xsl:value-of select="projEng"/></td>
		<td><xsl:value-of select="projMemo"/></td>
		<td><xsl:value-of select="projGrid"/></td>
		<td><xsl:value-of select="projPage"/></td>
		<td><xsl:value-of select="projCoordSystem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
		<td><xsl:value-of select="projLoc"/></td>
	</tr>
</xsl:template>

<xsl:template match="Ptim">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="PtimDTim"/></td>
		<td><xsl:value-of select="PtimDpth"/></td>
		<td><xsl:value-of select="PtimCas"/></td>
		<td><xsl:value-of select="PtimWat"/></td>
		<td><xsl:value-of select="PtimRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Ptst">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="PtstTesn"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="PtstCond"/></td>
		<td><xsl:value-of select="PtstSzun"/></td>
		<td><xsl:value-of select="PtstDiam"/></td>
		<td><xsl:value-of select="PtstLen"/></td>
		<td><xsl:value-of select="PtstMc"/></td>
		<td><xsl:value-of select="PtstBden"/></td>
		<td><xsl:value-of select="PtstDden"/></td>
		<td><xsl:value-of select="PtstIdia"/></td>
		<td><xsl:value-of select="PtstDmet"/></td>
		<td><xsl:value-of select="PtstVoid"/></td>
		<td><xsl:value-of select="PtstK"/></td>
		<td><xsl:value-of select="PtstTstr"/></td>
		<td><xsl:value-of select="PtstHygr"/></td>
		<td><xsl:value-of select="PtstIsat"/></td>
		<td><xsl:value-of select="PtstSat"/></td>
		<td><xsl:value-of select="PtstCons"/></td>
		<td><xsl:value-of select="PtstPden"/></td>
		<td><xsl:value-of select="PtstType"/></td>
		<td><xsl:value-of select="PtstCell"/></td>
		<td><xsl:value-of select="PtstRem"/></td>
		<td><xsl:value-of select="PtstMeth"/></td>
		<td><xsl:value-of select="PtstLab"/></td>
		<td><xsl:value-of select="PtstCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Pumg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="PumgTest"/></td>
		<td><xsl:value-of select="IdenCont"/></td>
		<td><xsl:value-of select="PumgMeth"/></td>
		<td><xsl:value-of select="PumgCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="PumgEnv"/></td>
		<td><xsl:value-of select="PumgRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Pumt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="PumgTest"/></td>
		<td><xsl:value-of select="PumtDTim"/></td>
		<td><xsl:value-of select="PumtDpth"/></td>
		<td><xsl:value-of select="PumtQuat"/></td>
		<td><xsl:value-of select="PumtRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Rccv">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="RccvTesn"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="RccvMc"/></td>
		<td><xsl:value-of select="RccvCcv"/></td>
		<td><xsl:value-of select="Rccv100"/></td>
		<td><xsl:value-of select="RccvRem"/></td>
		<td><xsl:value-of select="RccvMeth"/></td>
		<td><xsl:value-of select="RccvLab"/></td>
		<td><xsl:value-of select="RccvCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Rden">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="RdenMc"/></td>
		<td><xsl:value-of select="RdenSmc"/></td>
		<td><xsl:value-of select="RdenBden"/></td>
		<td><xsl:value-of select="RdenDden"/></td>
		<td><xsl:value-of select="RdenPoro"/></td>
		<td><xsl:value-of select="RdenPden"/></td>
		<td><xsl:value-of select="RdenPden"/></td>
		<td><xsl:value-of select="RdenRem"/></td>
		<td><xsl:value-of select="RdenMeth"/></td>
		<td><xsl:value-of select="RdenLab"/></td>
		<td><xsl:value-of select="RdenCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Reld">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="ReldDmax"/></td>
		<td><xsl:value-of select="Reld375"/></td>
		<td><xsl:value-of select="Reld063"/></td>
		<td><xsl:value-of select="Reld020"/></td>
		<td><xsl:value-of select="ReldDmin"/></td>
		<td><xsl:value-of select="ReldRem"/></td>
		<td><xsl:value-of select="ReldMeth"/></td>
		<td><xsl:value-of select="ReldLab"/></td>
		<td><xsl:value-of select="ReldCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Rplt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="RpltPls"/></td>
		<td><xsl:value-of select="RpltPlsi"/></td>
		<td><xsl:value-of select="RpltPltf"/></td>
		<td><xsl:value-of select="RpltMc"/></td>
		<td><xsl:value-of select="RpltRem"/></td>
		<td><xsl:value-of select="RpltMeth"/></td>
		<td><xsl:value-of select="RpltLab"/></td>
		<td><xsl:value-of select="RpltCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Rshr">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="RshrShor"/></td>
		<td><xsl:value-of select="RshrAxis"/></td>
		<td><xsl:value-of select="RshrNum"/></td>
		<td><xsl:value-of select="RshrRem"/></td>
		<td><xsl:value-of select="RshrMeth"/></td>
		<td><xsl:value-of select="RshrLab"/></td>
		<td><xsl:value-of select="RshrCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Rten">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="RtenSdia"/></td>
		<td><xsl:value-of select="RtenLen"/></td>
		<td><xsl:value-of select="RtenMc"/></td>
		<td><xsl:value-of select="RtenCond"/></td>
		<td><xsl:value-of select="RshrNum"/></td>
		<td><xsl:value-of select="RtenStra"/></td>
		<td><xsl:value-of select="RtenTens"/></td>
		<td><xsl:value-of select="RtenMode"/></td>
		<td><xsl:value-of select="RtenMach"/></td>
		<td><xsl:value-of select="RtenRem"/></td>
		<td><xsl:value-of select="RtenMeth"/></td>
		<td><xsl:value-of select="RtenLab"/></td>
		<td><xsl:value-of select="RtenCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Rucs">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="RucsSdia"/></td>
		<td><xsl:value-of select="RucsLen"/></td>
		<td><xsl:value-of select="RucsMc"/></td>
		<td><xsl:value-of select="RucsCond"/></td>
		<td><xsl:value-of select="RucsDurn"/></td>
		<td><xsl:value-of select="RucsStra"/></td>
		<td><xsl:value-of select="RucsUcs"/></td>
		<td><xsl:value-of select="RucsMode"/></td>
		<td><xsl:value-of select="RucsE"/></td>
		<td><xsl:value-of select="RucsMu"/></td>
		<td><xsl:value-of select="RucsSrem"/></td>
		<td><xsl:value-of select="RucsETyp"/></td>
		<td><xsl:value-of select="RucsMach"/></td>
		<td><xsl:value-of select="RucsRem"/></td>
		<td><xsl:value-of select="RucsMeth"/></td>
		<td><xsl:value-of select="RucsLab"/></td>
		<td><xsl:value-of select="RucsCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Rwco">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="RwcoMc"/></td>
		<td><xsl:value-of select="RwcoTemp"/></td>
		<td><xsl:value-of select="RwcoRem"/></td>
		<td><xsl:value-of select="RwcoMeth"/></td>
		<td><xsl:value-of select="RwcoLab"/></td>
		<td><xsl:value-of select="RwcoCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Samp">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SampBase"/></td>
		<td><xsl:value-of select="SampDTim"/></td>
		<td><xsl:value-of select="SampUblo"/></td>
		<td><xsl:value-of select="SampCont"/></td>
		<td><xsl:value-of select="SampPrep"/></td>
		<td><xsl:value-of select="SampDia"/></td>
		<td><xsl:value-of select="SampWDep"/></td>
		<td><xsl:value-of select="SampRecv"/></td>
		<td><xsl:value-of select="SampTech"/></td>
		<td><xsl:value-of select="SampMatx"/></td>
		<td><xsl:value-of select="SampTypC"/></td>
		<td><xsl:value-of select="SampWho"/></td>
		<td><xsl:value-of select="SampWhy"/></td>
		<td><xsl:value-of select="SampRem"/></td>
		<td><xsl:value-of select="SampDesc"/></td>
		<td><xsl:value-of select="SampDesd"/></td>
		<td><xsl:value-of select="SampLog"/></td>
		<td><xsl:value-of select="SampCond"/></td>
		<td><xsl:value-of select="SampClss"/></td>
		<td><xsl:value-of select="SampBar"/></td>
		<td><xsl:value-of select="SampTemp"/></td>
		<td><xsl:value-of select="SampPres"/></td>
		<td><xsl:value-of select="SampFlow"/></td>
		<td><xsl:value-of select="SampETim"/></td>
		<td><xsl:value-of select="SampDurn"/></td>
		<td><xsl:value-of select="SampCapt"/></td>
		<td><xsl:value-of select="SampLink"/></td>
		<td><xsl:value-of select="GeolStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Scdg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="ScdgTesn"/></td>
		<td><xsl:value-of select="SpdgDpth"/></td>
		<td><xsl:value-of select="ScdgPwpi"/></td>
		<td><xsl:value-of select="ScdgPwpe"/></td>
		<td><xsl:value-of select="ScdgDdis"/></td>
		<td><xsl:value-of select="ScdgT"/></td>
		<td><xsl:value-of select="ScdgCv"/></td>
		<td><xsl:value-of select="ScdgCvmt"/></td>
		<td><xsl:value-of select="ScdgCh"/></td>
		<td><xsl:value-of select="ScdgChmt"/></td>
		<td><xsl:value-of select="ScdgRem"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Scdt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="ScdgTesn"/></td>
		<td><xsl:value-of select="SpdgDpth"/></td>
		<td><xsl:value-of select="ScdtPwpi"/></td>
		<td><xsl:value-of select="ScdtRes"/></td>
		<td><xsl:value-of select="ScdtPwp1"/></td>
		<td><xsl:value-of select="ScdtPwp2"/></td>
		<td><xsl:value-of select="ScdtPwp3"/></td>
		<td><xsl:value-of select="ScdtRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Scpg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="ScpgTesn"/></td>
		<td><xsl:value-of select="ScpgType"/></td>
		<td><xsl:value-of select="SpdgRef"/></td>
		<td><xsl:value-of select="ScpgCsa"/></td>
		<td><xsl:value-of select="ScpgRate"/></td>
		<td><xsl:value-of select="ScpgFilt"/></td>
		<td><xsl:value-of select="ScpgFric"/></td>
		<td><xsl:value-of select="ScpgWat"/></td>
		<td><xsl:value-of select="ScpgWata"/></td>
		<td><xsl:value-of select="ScpgRem"/></td>
		<td><xsl:value-of select="ScpgEnv"/></td>
		<td><xsl:value-of select="ScpgCont"/></td>
		<td><xsl:value-of select="ScpgMeth"/></td>
		<td><xsl:value-of select="ScpgCred"/></td>
		<td><xsl:value-of select="ScpgCar"/></td>
		<td><xsl:value-of select="ScpgSlar"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Scpp">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="ScpgTesn"/></td>
		<td><xsl:value-of select="ScppTop"/></td>
		<td><xsl:value-of select="ScppBase"/></td>
		<td><xsl:value-of select="ScppRef"/></td>
		<td><xsl:value-of select="ScppRem"/></td>
		<td><xsl:value-of select="ScppCsbt"/></td>
		<td><xsl:value-of select="ScppCsu"/></td>
		<td><xsl:value-of select="ScppCrd"/></td>
		<td><xsl:value-of select="ScppCphi"/></td>
		<td><xsl:value-of select="ScppCic"/></td>
		<td><xsl:value-of select="ScppCspt"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Scpt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="ScpgTesn"/></td>
		<td><xsl:value-of select="SpdtDpth"/></td>
		<td><xsl:value-of select="ScptRes"/></td>
		<td><xsl:value-of select="ScptFres"/></td>
		<td><xsl:value-of select="ScptPwp1"/></td>
		<td><xsl:value-of select="ScptPwp2"/></td>
		<td><xsl:value-of select="ScptPwp3"/></td>
		<td><xsl:value-of select="ScptCon"/></td>
		<td><xsl:value-of select="ScptTemp"/></td>
		<td><xsl:value-of select="ScptPh"/></td>
		<td><xsl:value-of select="ScptSlp1"/></td>
		<td><xsl:value-of select="ScptSlp2"/></td>
		<td><xsl:value-of select="ScptRedx"/></td>
		<td><xsl:value-of select="ScptMagt"/></td>
		<td><xsl:value-of select="ScptMagx"/></td>
		<td><xsl:value-of select="ScptMagy"/></td>
		<td><xsl:value-of select="ScptMagz"/></td>
		<td><xsl:value-of select="ScptSmp"/></td>
		<td><xsl:value-of select="ScptNgam"/></td>
		<td><xsl:value-of select="ScptRem"/></td>
		<td><xsl:value-of select="ScptFrr"/></td>
		<td><xsl:value-of select="ScptQt"/></td>
		<td><xsl:value-of select="ScptQt"/></td>
		<td><xsl:value-of select="ScptQe"/></td>
		<td><xsl:value-of select="ScptBden"/></td>
		<td><xsl:value-of select="ScptCPo"/></td>
		<td><xsl:value-of select="ScptCPod"/></td>
		<td><xsl:value-of select="ScptQnet"/></td>
		<td><xsl:value-of select="ScptFrrc"/></td>
		<td><xsl:value-of select="ScptExpp"/></td>
		<td><xsl:value-of select="ScptBq"/></td>
		<td><xsl:value-of select="ScptIssp"/></td>
		<td><xsl:value-of select="ScptNqt"/></td>
		<td><xsl:value-of select="ScptNfr"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Shbg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="ShbgType"/></td>
		<td><xsl:value-of select="ShbgCond"/></td>
		<td><xsl:value-of select="ShbgCons"/></td>
		<td><xsl:value-of select="ShpgPCoh"/></td>
		<td><xsl:value-of select="ShpgPhi"/></td>
		<td><xsl:value-of select="ShpgRCoh"/></td>
		<td><xsl:value-of select="ShpgRPhi"/></td>
		<td><xsl:value-of select="ShbgRem"/></td>
		<td><xsl:value-of select="ShbgRem"/></td>
		<td><xsl:value-of select="ShbgMeth"/></td>
		<td><xsl:value-of select="ShbgLab"/></td>
		<td><xsl:value-of select="ShbgCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Shbt">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="ShbtTesn"/></td>
		<td><xsl:value-of select="ShbtBden"/></td>
		<td><xsl:value-of select="ShbtDden"/></td>
		<td><xsl:value-of select="ShbtNorm"/></td>
		<td><xsl:value-of select="ShbtDisp"/></td>
		<td><xsl:value-of select="ShbtDisr"/></td>
		<td><xsl:value-of select="ShbtRevs"/></td>
		<td><xsl:value-of select="ShbtPeak"/></td>
		<td><xsl:value-of select="ShbtRes"/></td>
		<td><xsl:value-of select="ShbtPdis"/></td>
		<td><xsl:value-of select="ShbtRdis"/></td>
		<td><xsl:value-of select="ShbtPden"/></td>
		<td><xsl:value-of select="ShbtIvr"/></td>
		<td><xsl:value-of select="ShbtMci"/></td>
		<td><xsl:value-of select="ShbtMcf"/></td>
		<td><xsl:value-of select="ShbtDia1"/></td>
		<td><xsl:value-of select="ShbtDia2"/></td>
		<td><xsl:value-of select="ShbtHgt"/></td>
		<td><xsl:value-of select="ShbtCrit"/></td>
		<td><xsl:value-of select="ShbtRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Suct">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="SuctDiam"/></td>
		<td><xsl:value-of select="SuctLen"/></td>
		<td><xsl:value-of select="SuctCond"/></td>
		<td><xsl:value-of select="SuctBden"/></td>
		<td><xsl:value-of select="SuctDden"/></td>
		<td><xsl:value-of select="SuctMc"/></td>
		<td><xsl:value-of select="SuctVal"/></td>
		<td><xsl:value-of select="SuctRem"/></td>
		<td><xsl:value-of select="SuctMeth"/></td>
		<td><xsl:value-of select="SuctLab"/></td>
		<td><xsl:value-of select="SuctCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Tnpc">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="TnpcTesn"/></td>
		<td><xsl:value-of select="TnpcDry"/></td>
		<td><xsl:value-of select="TnpcWet"/></td>
		<td><xsl:value-of select="TnpcRem"/></td>
		<td><xsl:value-of select="TnpcMeth"/></td>
		<td><xsl:value-of select="TncpLab"/></td>
		<td><xsl:value-of select="TncpCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Treg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="TregType"/></td>
		<td><xsl:value-of select="TregCond"/></td>
		<td><xsl:value-of select="TregCoh"/></td>
		<td><xsl:value-of select="TregPhi"/></td>
		<td><xsl:value-of select="TregFcr"/></td>
		<td><xsl:value-of select="TregRem"/></td>
		<td><xsl:value-of select="TregMeth"/></td>
		<td><xsl:value-of select="TregLab"/></td>
		<td><xsl:value-of select="TregCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Trem">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="TremDtim"/></td>
		<td><xsl:value-of select="TremComp"/></td>
		<td><xsl:value-of select="TremRem"/></td>
		<td><xsl:value-of select="TremDurn"/></td>
		<td><xsl:value-of select="TremEtim"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Tret">
	<tr>
	<td><xsl:value-of select="HoleId"/></td>
	<td><xsl:value-of select="SampTop"/></td>
	<td><xsl:value-of select="SampRef"/></td>
	<td><xsl:value-of select="SampType"/></td>
	<td><xsl:value-of select="SampId"/></td>
	<td><xsl:value-of select="SpecRef"/></td>
	<td><xsl:value-of select="SpecDpth"/></td>
	<td><xsl:value-of select="TretTesn"/></td>
	<td><xsl:value-of select="TretSdia"/></td>
	<td><xsl:value-of select="TretLen"/></td>
	<td><xsl:value-of select="TretImc"/></td>
	<td><xsl:value-of select="TretFmc"/></td>
	<td><xsl:value-of select="TretBden"/></td>
	<td><xsl:value-of select="TretDden"/></td>
	<td><xsl:value-of select="TretSat"/></td>
	<td><xsl:value-of select="TretCons"/></td>
	<td><xsl:value-of select="TretConp"/></td>
	<td><xsl:value-of select="TretCell"/></td>
	<td><xsl:value-of select="TretPwpi"/></td>
	<td><xsl:value-of select="TretStrr"/></td>
	<td><xsl:value-of select="TretStrn"/></td>
	<td><xsl:value-of select="TretDevf"/></td>
	<td><xsl:value-of select="TretPwpf"/></td>
	<td><xsl:value-of select="TretStv"/></td>
	<td><xsl:value-of select="TretMode"/></td>
	<td><xsl:value-of select="TretRem"/></td>
	<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Trig">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="SpecDesc"/></td>
		<td><xsl:value-of select="SpecPrep"/></td>
		<td><xsl:value-of select="TrigType"/></td>
		<td><xsl:value-of select="TrigCond"/></td>
		<td><xsl:value-of select="TrigRem"/></td>
		<td><xsl:value-of select="TrigMeth"/></td>
		<td><xsl:value-of select="TrigLab"/></td>
		<td><xsl:value-of select="TrigCred"/></td>
		<td><xsl:value-of select="TestStat"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Trit">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="SampTop"/></td>
		<td><xsl:value-of select="SampRef"/></td>
		<td><xsl:value-of select="SampType"/></td>
		<td><xsl:value-of select="SampId"/></td>
		<td><xsl:value-of select="SpecRef"/></td>
		<td><xsl:value-of select="SpecDpth"/></td>
		<td><xsl:value-of select="TritTesn"/></td>
		<td><xsl:value-of select="TritSdia"/></td>
		<td><xsl:value-of select="TritSLen"/></td>
		<td><xsl:value-of select="TritImc"/></td>
		<td><xsl:value-of select="TritFmc"/></td>
		<td><xsl:value-of select="TritCell"/></td>
		<td><xsl:value-of select="TritDevf"/></td>
		<td><xsl:value-of select="TritBden"/></td>
		<td><xsl:value-of select="TritDden"/></td>
		<td><xsl:value-of select="TritStrn"/></td>
		<td><xsl:value-of select="TritMode"/></td>
		<td><xsl:value-of select="TritRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Unit">
	<tr>
	<td><xsl:value-of select="UnitUnit"/></td>
	<td><xsl:value-of select="UnitDesc"/></td>
	</tr>
</xsl:template>

<xsl:template match="Wadd">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="WaddTop"/></td>
		<td><xsl:value-of select="WaddBase"/></td>
		<td><xsl:value-of select="WaddVolm"/></td>
		<td><xsl:value-of select="WaddMeth"/></td>
		<td><xsl:value-of select="WaddRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Weth">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="WethTop"/></td>
		<td><xsl:value-of select="WethBase"/></td>
		<td><xsl:value-of select="WethSch"/></td>
		<td><xsl:value-of select="WethSys"/></td>
		<td><xsl:value-of select="WethGrad"/></td>
		<td><xsl:value-of select="WethRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Wins">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="WinsTop"/></td>
		<td><xsl:value-of select="WinsBase"/></td>
		<td><xsl:value-of select="WinsDiam"/></td>
		<td><xsl:value-of select="WinsDurn"/></td>
		<td><xsl:value-of select="WinsRec"/></td>
		<td><xsl:value-of select="WinsRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Wstg">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="WStgDpth"/></td>
		<td><xsl:value-of select="WStgDtim"/></td>
		<td><xsl:value-of select="WStgSeal"/></td>
		<td><xsl:value-of select="WStgCas"/></td>
		<td><xsl:value-of select="WstgRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

<xsl:template match="Wstd">
	<tr>
		<td><xsl:value-of select="HoleId"/></td>
		<td><xsl:value-of select="WStgDep"/></td>
		<td><xsl:value-of select="WStdNmin"/></td>
		<td><xsl:value-of select="WStdPost"/></td>
		<td><xsl:value-of select="WstdRem"/></td>
		<td><xsl:value-of select="FileFset"/></td>
	</tr>
</xsl:template>

</xsl:stylesheet>