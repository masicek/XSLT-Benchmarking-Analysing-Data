<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
	
	<xsl:output method="text" />
	
	<xsl:param name="value" />
	
	
	<xsl:template match="/" mode="output">
		<xsl:value-of select="count(/xsl:stylesheet/xsl:output[lower-case(@method) = lower-case($value)])" />
	</xsl:template>
	
	<xsl:template match="/" mode="template_name_substr">
		<xsl:value-of select="count(//xsl:template[contains(lower-case(@name), lower-case($value))])" />
	</xsl:template>
	
	<xsl:template match="/" mode="template_match_substr">
		<xsl:value-of select="count(//xsl:template[contains(lower-case(@match), lower-case($value))])" />
	</xsl:template>
	
	<xsl:template match="/" mode="template_name_count">
		<xsl:value-of select="count(//xsl:template[@name])" />
	</xsl:template>

	<xsl:template match="/" mode="template_match_count">
		<xsl:value-of select="count(//xsl:template[@match])" />
	</xsl:template>
		
	<xsl:template match="/" mode="element_name">
		<xsl:value-of select="count(//xsl:element[lower-case(@name) = lower-case($value)])" />
	</xsl:template>
	
	<xsl:template match="/" mode="google_variable_name">
		<xsl:value-of select="count(//xsl:variable[
			@name = 'choose_result_page_header' or
			@name = 'search_box_size' or
			@name = 'choose_bottom_navigation' or
			@name = 'show_res_title' or
			@name = 'choose_adv_search_page_header' or
			@name = 'global_vlink_color' or
			@name = 'show_result_page_help_link' or
			@name = 'show_search_info' or
			@name = 'spelling_text' or
			@name = 'show_res_url'
		])" />
	</xsl:template>
	
	
	
</xsl:stylesheet>