<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" type="text/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
<xsl:variable name="scaleY" select="200.0"/>
<xsl:variable name="textX1" select="225.0"/>
<xsl:variable name="holeX1" select="100.0"/>
<xsl:variable name="holeX2" select="200.0"/>

<xsl:template match="/">

<html>
  <head>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  <title><xsl:value-of select="DataStructureAGSML/Hole/HoleId"/></title>
  <link rel="stylesheet" type="text/css" href="ags_format.css" />
  <script type="text/javascript" src="ags_java.js"></script>
  </head>
  <body onload="loadSVGL()">
  <h2>Borehole Log for for Hole  
				<xsl:element name="a">
					<xsl:attribute name="href">
						http://www.google.com/maps/place/
						<xsl:value-of select="DataStructureAGSML/Hole/pointGintCoordinateLatitude"/>,
						<xsl:value-of select="DataStructureAGSML/Hole/pointGintCoordinateLongitude"/>
					</xsl:attribute>
						<xsl:value-of select="DataStructureAGSML/Hole/HoleId"/>
				</xsl:element>
  </h2>
  <xsl:apply-templates select="DataStructureAGSML/Hole/groundInformation"/> 
  </body>
  </html>
</xsl:template>

<xsl:template match="DataStructureAGSML/Hole/groundInformation">
	<svg>
		<xsl:apply-templates select="Geol"/>
	 	<xsl:apply-templates select="Detl"/> 
	</svg>
</xsl:template>

<xsl:template match="Detl">
	<xsl:element name = "text" id="multiline_text">
	<xsl:attribute name ="x"><xsl:value-of select="$textX1"/></xsl:attribute>
	  <xsl:attribute name ="x"><xsl:value-of select="$textX1"/></xsl:attribute>
	  <xsl:attribute name ="y"><xsl:value-of select="DetlTop * $scaleY"/></xsl:attribute>
	  <xsl:value-of select="DetlDesc"/>
	</xsl:element>
</xsl:template>

<xsl:template match="Geol">
     <xsl:element name ="polygon">
		 <xsl:attribute name ="points">
			<xsl:value-of select="$holeX1"/>,<xsl:value-of select="GeolTop * $scaleY"/>,
			<xsl:value-of select="$holeX2"/>,<xsl:value-of select="GeolTop  * $scaleY"/>,
			<xsl:value-of select="$holeX2"/>,<xsl:value-of select="GeolBase * $scaleY"/>,
			<xsl:value-of select="$holeX1"/>,<xsl:value-of select="GeolBase * $scaleY"/>,
			<xsl:value-of select="$holeX1"/>,<xsl:value-of select="GeolTop * $scaleY"/>,
		</xsl:attribute>
		<xsl:attribute name ="style">
			stroke		:	#660000; 
			fill		:	#none;
			stroke-width: 	1;
		</xsl:attribute>
	</xsl:element>
	<xsl:element name = "text" id="multiline_text">
	  <xsl:attribute name ="x"><xsl:value-of select="$textX1"/></xsl:attribute>
	  <xsl:attribute name ="y"><xsl:value-of select="GeolTop * $scaleY"/></xsl:attribute>
	  <xsl:value-of select="GeolDesc"/>
	 </xsl:element>
	<!-- 	<td><xsl:value-of select="GeolTop"/></td>
		<td><xsl:value-of select="GeolBase"/></td>
		<td><xsl:value-of select="GeolDesc"/></td>
		<td><xsl:value-of select="GeolLeg"/></td>
		<td><xsl:value-of select="GeolGeol"/></td>
		<td><xsl:value-of select="GeolGeo2"/></td>
		<td><xsl:value-of select="GeolStat"/></td>
		<td><xsl:value-of select="FileFSet"/></td> -->
</xsl:template>

</xsl:stylesheet>