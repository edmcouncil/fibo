<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

  <!-- Converts FIBO Glossary into a CSV file with columns:
    term type synonyms definition generated-definition -->
  <!-- Definitions are placed in quotes with double quotes converted to single -->

  <xsl:output method="text" omit-xml-declaration="yes" />
  <xsl:variable name="quot">"&#x0A;</xsl:variable>
  <xsl:variable name="apos">' </xsl:variable>
  
  <xsl:template match="/">
    <xsl:text>Term,Type,Synonyms,Definition,Generated Definition&#x0A;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="dt/span[starts-with(@class, 'headterm')]">
    <!-- Term -->
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>&quot;,</xsl:text>
    <!-- Type -->
    <xsl:choose>
      <xsl:when test="contains(@class, 'classterm')">
        <xsl:text>Class</xsl:text>
      </xsl:when>
      <xsl:when test="contains(@class, 'propterm')">
        <xsl:text>Property</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:text>,&quot;</xsl:text>
    <!-- Synonym -->
    <xsl:for-each select="../following-sibling::dd[p/p[span='Synonym']][1]/p/p[span='Synonym']">
      <!-- Cope with a list if there is more than one -->
      <xsl:choose>
        <xsl:when test="ul/li">
          <xsl:for-each select="ul/li/span">
            <xsl:value-of select="normalize-space(translate(., $quot, $apos))"/>
            <xsl:if test="position() != last()">,</xsl:if>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="span[@class='classdoc2']">
          <xsl:value-of select="normalize-space(translate(span[@class='classdoc2'], $quot, $apos))"/>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
    <xsl:text>&quot;,&quot;</xsl:text>
    <!-- Definition -->
    <xsl:value-of select="normalize-space(translate(../following-sibling::dd[p/span='Definition'][1]/p/span[@class = 'classdoc2'], $quot, $apos))"/>
    <xsl:text>&quot;,&quot;</xsl:text>
    <!-- Generated definition, different format when it's for a property -->
    <xsl:choose>
      <xsl:when test="contains(@class, 'classterm')">
        <xsl:for-each select="../following-sibling::div[@class='generateddesc'][1]/dd">
           <xsl:value-of select="normalize-space(translate(p, $quot, $apos))"/>
           <xsl:for-each select="ul/li">
             <xsl:text>&#x0A;</xsl:text>
             <xsl:value-of select="normalize-space(translate(., $quot, $apos))"/>
           </xsl:for-each>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="contains(@class, 'propterm')">
        <xsl:value-of select="normalize-space(translate(../following-sibling::dd[1]/p[not(@class)], $quot, $apos))"/>
      </xsl:when>
    </xsl:choose>
    <xsl:text>&quot;&#x0A;</xsl:text>   
  </xsl:template>

  <xsl:template match="node()">
    <xsl:apply-templates/>
  </xsl:template>


</xsl:stylesheet>
