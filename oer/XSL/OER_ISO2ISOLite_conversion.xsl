<?xml version="1.0" encoding="UTF-8"?>
<!-- thomas.jaensch@noaa.gov for NCEI OneStop, 2017 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gmi="http://www.isotc211.org/2005/gmi"  xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:date="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" exclude-result-prefixes='date'>

	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:variable name="stylesheetVersion" select="'1.0'"/>
	<xsl:strip-space elements="*"/>

	<!-- Variables -->
	<xsl:variable name="datasetname" select="'OER'"/>
	<xsl:variable name="fileidentifier" select="/gmi:MI_Metadata/gmd:fileIdentifier/gco:CharacterString"/>
	
	<!-- Templates -->
	<xsl:template name="writeCharacterString">
		<xsl:param name="stringToWrite"/>
		<xsl:choose>
			<xsl:when test="$stringToWrite">
				<gco:CharacterString>
					<xsl:value-of select="$stringToWrite"/>
				</gco:CharacterString>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="gco:nilReason"><xsl:value-of select="'missing'"/></xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template> <!-- end <xsl:template name="writeCharacterString"> -->

	<!-- Write ISOLite Metadata -->
	<xsl:template match="/">
		<gmi:MI_Metadata xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx" xsi:schemaLocation="http://www.isotc211.org/2005/gmi http://www.ngdc.noaa.gov/metadata/published/xsd/schema.xsd">
			
			<!-- fileIdentifier -->
			<gmd:fileIdentifier>
				<xsl:call-template name="writeCharacterString">
					<xsl:with-param name="stringToWrite" select="concat($datasetname,'.',$fileidentifier)"/>
				</xsl:call-template>
			</gmd:fileIdentifier>

			<!-- language -->
			<xsl:copy-of select="/gmi:MI_Metadata/gmd:language" />

			<!-- characterSet -->
			<xsl:copy-of select="/gmi:MI_Metadata/gmd:characterSet" />

			<!-- parentIdentifier -->
			<xsl:copy-of select="/gmi:MI_Metadata/gmd:parentIdentifier" />

			<!-- hierarchyLevel -->
			<xsl:copy-of select="/gmi:MI_Metadata/gmd:hierarchyLevel" />

			<!-- hierarchyLevelName -->
			<gmd:hierarchyLevelName>
				<gco:CharacterString>Granule</gco:CharacterString>
			</gmd:hierarchyLevelName>

			<!-- contact -->
			<xsl:copy-of select="/gmi:MI_Metadata/gmd:contact" />

			<!-- dateStamp -->
			<gmd:dateStamp>
				<gco:Date>
					<xsl:value-of select="date:date()"/>
				</gco:Date>
			</gmd:dateStamp>

			<!-- metadataStandardName -->
			<xsl:copy-of select="/gmi:MI_Metadata/gmd:metadataStandardName" />

			<!-- metadataStandardVersion -->
			<xsl:copy-of select="/gmi:MI_Metadata/gmd:metadataStandardVersion" />

			<!-- identificationInfo -->
			<xsl:copy-of select="/gmi:MI_Metadata/gmd:identificationInfo" />

			<!-- distributionInfo -->
			<xsl:copy-of select="/gmi:MI_Metadata/gmd:distributionInfo" />

			
		</gmi:MI_Metadata> <!-- end <gmi:MI_Metadata> -->
	</xsl:template> <!-- end <xsl:template match="/"> -->

</xsl:stylesheet>