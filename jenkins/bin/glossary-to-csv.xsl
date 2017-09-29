<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

  <!-- Converts FIBO GLossary into a CSV file with columns:
    term type definition generated-definition synonyms-->

  <xsl:output method="text" omit-xml-declaration="yes" />
  <xsl:variable name="quot">"&#x0A;</xsl:variable>
  <xsl:variable name="apos">' </xsl:variable>
  
  <xsl:template match="/">
    <xsl:text>Term,Type,Definition,Generated Definition,Synonyms&#x0A;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="dt[span[@class = 'headterm']]">
    <xsl:value-of select="span[@class = 'headterm']"/>
    <xsl:text>,&quot;</xsl:text>
    <xsl:value-of select="normalize-space(translate(following-sibling::dd[1]/p/span[@class = 'classdoc'], $quot, $apos))"/>
    <xsl:text>&quot;,&quot;</xsl:text>
    <xsl:for-each select="following-sibling::div[1][@class = 'generateddesc model']/dd">
       <xsl:value-of select="normalize-space(translate(p, $quot, $apos))"/>
       <xsl:for-each select="ul/li">
         <xsl:text>&#x0A;</xsl:text>
         <xsl:value-of select="normalize-space(translate(., $quot, $apos))"/>
       </xsl:for-each>
    </xsl:for-each>
    <xsl:text>&quot;&#x0A;</xsl:text>   
  </xsl:template>

  <xsl:template match="node()">
    <xsl:apply-templates/>
  </xsl:template>


</xsl:stylesheet>
