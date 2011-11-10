<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
	<xsl:output method="text" />
	
	<xsl:template match="/|*">
		<xsl:element name="item">
			<xsl:value-of select="count(*)" /><xsl:text>,</xsl:text>
		</xsl:element>
		<xsl:apply-templates select="*"/>
	</xsl:template>
	
</xsl:stylesheet>