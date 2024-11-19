<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY slongdes "&#xF127;"> <!-- LATIN SMALL LETTER LONG S DESCENDING -->
<!ENTITY et "&#x204A;">		<!-- TIRONIAN SIGN ET -->
<!ENTITY combmacr "&#x0304;">		<!-- COMBINING MACRON -->
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" 
				xmlns:tei="http://www.tei-c.org/ns/1.0" 
				exclude-result-prefixes="#all">

 <xsl:output method="html" doctype-public="html" encoding="utf-8"/>

<xsl:preserve-space elements="*"/>
<xsl:strip-space elements="tei:choice tei:w tei:subst"/>

 <xsl:template match="/">
  <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;&#xa;</xsl:text>
  <html>
   <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>
  	 <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
    </title>
	<style type="text/css">
	 @font-face {
				font-family:Junicode;
				src:local('Junicode'),url(Junicode.ttf),url('https://echoe.uni-goettingen.de/fonts/Junicode.ttf');
			}
	html		{
				font-family: 'Junicode';
			}
	#text		{
				margin-top:8px;
				line-height:150%;
			}
	</style>
   </head>
   <body>
    <xsl:for-each select="tei:TEI">
     <br/>
     <br/>
	<h1><xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h1>

<!-- This apply-template renders the main text. -->
     <xsl:apply-templates select="tei:text"/>
	</xsl:for-each>
   </body>
  </html>
 </xsl:template>


 <xsl:template match="tei:text">
   <xsl:apply-templates/>
 </xsl:template>

<xsl:template match="comment()"/>

<!--VERSE LINES-->
 <xsl:template match="tei:l">
	 <div class="verse">
  		<xsl:apply-templates/> 
	</div>
 </xsl:template>

<!--CHOICE-->
 <xsl:template match="tei:choice">
  <xsl:apply-templates/> 
 </xsl:template>

 <!-- ABBREVIATION: This template specifies whether to display the content of the abbr element. -->
 <xsl:template match="tei:abbr">
 </xsl:template>

 <!-- ABBREVIATION MARKER: This template specifies whether to display the content of the am element. -->
 <xsl:template match="tei:am">
 </xsl:template>

 <!-- EXPAN: This template specifies whether to display the content of the expan element. -->
 <xsl:template match="tei:expan">
     <xsl:apply-templates/>
 </xsl:template>

 <!-- EX: This template specifies whether and how to display the content of the ex element. -->
 <xsl:template match="tei:ex">
   <xsl:element name="em"><xsl:apply-templates/></xsl:element>
 </xsl:template>

</xsl:stylesheet>
