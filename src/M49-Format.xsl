<?xml version="1.0"?>
<!DOCTYPE stylesheet [
  <!ENTITY xsd "http://www.w3.org/2001/XMLSchema#" >
  <!ENTITY rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#" >
  <!ENTITY dct "http://purl.org/dc/terms/" >
  <!ENTITY sm "http://www.omg.org/techprocess/ab/SpecificationMetadata/" >
  <!ENTITY lcc-lr "http://www.omg.org/spec/LCC/Languages/LanguageRepresentation/" >
  <!ENTITY lcc-639-1 "http://www.omg.org/spec/LCC/Languages/ISO639-1-LanguageCodes/" >
  <!ENTITY lcc-639-2 "http://www.omg.org/spec/LCC/Languages/ISO639-2-LanguageCodes/" >
  <!ENTITY lcc-cr "http://www.omg.org/spec/LCC/Countries/CountryRepresentation/" >
  <!ENTITY lcc-3166-1 "http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/" >
  <!ENTITY lcc-m49 "http://www.omg.org/spec/LCC/Countries/UN-M49-RegionCodes/" >
]>

<!-- This file is copyright 2017, Adaptive Inc.  -->
<!-- All rights reserved. -->
<!-- A limited license is provided to use and modify this file purely for the purpose of maintaining the ontology 
     in the OMG specification "Languages Countries and Codes (LCC)" and purely by members of the LCC Revision Task Force (RTF)  -->
<!-- IT MAY NOT, IN WHOLE OR PART, BE USED, COPIED, DISTRIBUTED, MODIFIED OR USED AS THE BASIS OF ANY DERIVED WORK OR 
     FOR ANY OTHER PURPOSE -->
<!-- To license for any other purpose, please contact info@adaptive.com -->


<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
xmlns:owl="http://www.w3.org/2002/07/owl#"
xmlns:skos="http://www.w3.org/2004/02/skos/core#" 
xmlns:dct="http://purl.org/dc/terms/"
xmlns:xsd ="http://www.w3.org/2001/XMLSchema#"
xmlns:sm="http://www.omg.org/techprocess/ab/SpecificationMetadata/" 
xmlns:lcc-lr="http://www.omg.org/spec/LCC/Languages/LanguageRepresentation/"
xmlns:lcc-cr="http://www.omg.org/spec/LCC/Countries/CountryRepresentation/"
xmlns:lcc-3166-1="http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/"
exclude-result-prefixes="xsl xs">

<!-- Formats a raw RDF/XML file generated from the M49 CSV and adds formating for standards publication -->  
<!-- Version IRI needs to be updated -->  

  <xsl:output method="xml" indent="yes" media-type="application/xml" use-character-maps="ampersand"/> 
  <xsl:strip-space elements="*"/>
  <!-- This is needed to allow use of XML entities such as &lcc-cr; in the output -->
  <xsl:character-map name="ampersand">
    <xsl:output-character character="&amp;" string="&#x26;"/>
  </xsl:character-map> 

  <xsl:variable name="countries-base-uri" select="'&amp;lcc-3166-1;'"/>
  <xsl:variable name="m49-base-uri" select="'&amp;lcc-m49;'"/>
  
<!-- Need to consult the ontology file for country codes in order to construct the country URIs -->
<!-- Assume file is local -->
  <xsl:variable name="countries" select="document('ISO3166-1-CountryCodes.rdf')/rdf:RDF/owl:NamedIndividual"/>  

<!-- Displays supplied text in a highly visible comment block -->
<!-- Currently uses style from OWL API -->
<xsl:template name="comment-block">
  <xsl:param name="the-text"></xsl:param> <!-- What to display in the block -->
  <xsl:text>

  </xsl:text>
  <xsl:comment>
    <xsl:text>
    ///////////////////////////////////////////////////////////////////////////////////////
    //
    // </xsl:text><xsl:value-of select="$the-text"/><xsl:text>
    //
    ///////////////////////////////////////////////////////////////////////////////////////
    </xsl:text>
  </xsl:comment>
  <xsl:text>
</xsl:text>
</xsl:template>

<!-- Turns a string into camelcase. Assume spaces have been replaced by _ already  -->
  <xsl:template name="camelCase">
    <xsl:param name="inString" select="@name"/>
    <xsl:variable name="intermed">
      <xsl:for-each select="tokenize($inString, '_')">
        <xsl:value-of select="concat(upper-case(substring(., 1, 1)), substring(., 2))"/>
      </xsl:for-each>
    </xsl:variable>
    <!-- Stop at the first punctuation -->
    <xsl:variable name="asciiString" select="replace(normalize-unicode($intermed, 'NFD'), '\P{IsBasicLatin}', '')"/>
    <xsl:variable name="noAposDotString" select="translate($asciiString, '&apos;&apos;.', '')"/>
    <xsl:variable name="cleanString" select="replace($noAposDotString, '([-0-9a-zA-Z]+)(.*)', '$1')"/>
    <xsl:value-of select="$cleanString"/>
  </xsl:template>

<!-- Looks up country URI given 3 character code -->
<xsl:template name="lookup-country-uri">
  <xsl:param name="code3" select="language-alpha-3-code"/>
  <xsl:variable name="uri" select="$countries[rdfs:label=$code3]/lcc-lr:denotes/@rdf:resource"/>
  <!-- Messing around to force use of XML entry in reference -->
  <xsl:value-of select="concat('&amp;lcc-3166-1;',substring-after($uri,'&lcc-3166-1;'))"/>
</xsl:template> 

<xsl:template name="doLabels">
  <!-- Specifically process English, French, Local names -->
  <xsl:for-each select="full-name">
    <xsl:choose>
      <xsl:when test="@lang3code='eng'">
        <lcc-cr:hasEnglishFullName rdf:datatype="&amp;xsd;string">
          <xsl:copy-of select="@xml:lang"/>
          <xsl:value-of select="."/>
        </lcc-cr:hasEnglishFullName>
      </xsl:when>
      <xsl:when test="@lang3code='fra'">
        <lcc-cr:hasFrenchFullName rdf:datatype="&amp;xsd;string">
          <xsl:copy-of select="@xml:lang"/>
          <xsl:value-of select="."/>
        </lcc-cr:hasFrenchFullName>
      </xsl:when>
      <xsl:otherwise>
        <lcc-cr:hasLocalFullName rdf:datatype="&amp;xsd;string">
          <xsl:copy-of select="@xml:lang"/>
          <xsl:value-of select="."/>
        </lcc-cr:hasLocalFullName> 
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
  <xsl:for-each select="short-name">
    <xsl:choose>
      <xsl:when test="@lang3code='eng'">
        <lcc-cr:hasEnglishShortName rdf:datatype="&amp;xsd;string">
          <xsl:copy-of select="@xml:lang"/>
          <xsl:value-of select="."/>
        </lcc-cr:hasEnglishShortName>
      </xsl:when>
      <xsl:when test="@lang3code='fra'">
        <lcc-cr:hasFrenchShortName rdf:datatype="&amp;xsd;string">
          <xsl:copy-of select="@xml:lang"/>
          <xsl:value-of select="."/>
        </lcc-cr:hasFrenchShortName>
      </xsl:when>
      <xsl:otherwise>
        <lcc-cr:hasLocalShortName rdf:datatype="&amp;xsd;string">
          <xsl:copy-of select="@xml:lang"/>
          <xsl:value-of select="."/>
        </lcc-cr:hasLocalShortName> 
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
  <xsl:for-each select="short-name-upper-case">
    <xsl:choose>
      <xsl:when test="@lang3code='eng'">
        <lcc-cr:hasEnglishShortNameInCapitals rdf:datatype="&amp;xsd;string">
          <xsl:copy-of select="@xml:lang"/>
          <xsl:value-of select="."/>
        </lcc-cr:hasEnglishShortNameInCapitals>
      </xsl:when>
      <xsl:when test="@lang3code='fra'">
        <lcc-cr:hasFrenchShortNameInCapitals rdf:datatype="&amp;xsd;string">
          <xsl:copy-of select="@xml:lang"/>
          <xsl:value-of select="."/>
        </lcc-cr:hasFrenchShortNameInCapitals>
      </xsl:when>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>


<xsl:template match="/">
  <xsl:text disable-output-escaping="yes"> 
<![CDATA[<!DOCTYPE rdf:RDF [
    <!ENTITY xsd "http://www.w3.org/2001/XMLSchema#" >
    <!ENTITY rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#" >
    <!ENTITY dct "http://purl.org/dc/terms/" >
    <!ENTITY sm "http://www.omg.org/techprocess/ab/SpecificationMetadata/" >
    <!ENTITY lcc-lr "http://www.omg.org/spec/LCC/Languages/LanguageRepresentation/" >
    <!ENTITY lcc-cr "http://www.omg.org/spec/LCC/Countries/CountryRepresentation/" >
    <!ENTITY lcc-3166-1 "http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/" >
    <!ENTITY lcc-m49 "http://www.omg.org/spec/LCC/Countries/UN-M49-RegionCodes/" >
    ]> ]]>
</xsl:text>    
  
<rdf:RDF      
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:dct="http://purl.org/dc/terms/"
    xmlns:sm="http://www.omg.org/techprocess/ab/SpecificationMetadata/"
    xmlns:lcc-lr="http://www.omg.org/spec/LCC/Languages/LanguageRepresentation/"
    xmlns:lcc-cr="http://www.omg.org/spec/LCC/Countries/CountryRepresentation/"
    xmlns:lcc-3166-1="http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/"
    xmlns:lcc-m49="http://www.omg.org/spec/LCC/Countries/UN-M49-RegionCodes/"
    xml:base="http://www.omg.org/spec/LCC/Countries/UN-M49-RegionCodes/">  
    
  <xsl:value-of select="'&#x0A;&#x0A;'"/>
  <owl:Ontology>
      <!-- Boiler plate -->
      <xsl:attribute name="rdf:about" select="$m49-base-uri"/>
      <rdfs:label>United Nations Standard Country or Area Codes for Statistical Use (M49 Geographic Region Codes) Ontology</rdfs:label>
      <xsl:value-of select="'&#x0A;&#x0A;'"/>
      <xsl:comment> Curation and Rights Metadata for the LCC M49 Geographic Region Codes Ontology </xsl:comment>
      <xsl:value-of select="'&#x0A;&#x0A;'"/>
      <sm:copyright rdf:datatype="&amp;xsd;string">Copyright (c) 2015-2017 Object Management Group, Inc.
        Copyright (c) 2015-2017 Adaptive Inc.
        Copyright (c) 2015-2017 Thematix Partners LLC
        Copyright (c) 2015-2017 Unisys
      </sm:copyright>
      <dct:license rdf:datatype="&amp;xsd;anyURI">&sm;MITLicense</dct:license>       
      <xsl:value-of select="'&#x0A;&#x0A;'"/>
      <xsl:comment> Ontology/File-Level Metadata for the M49 Geographic Region Codes Ontology </xsl:comment>
      <xsl:value-of select="'&#x0A;&#x0A;'"/>
      <sm:filename rdf:datatype="&amp;xsd;string">UN-M49-RegionCodes.rdf</sm:filename>
      <sm:fileAbbreviation rdf:datatype="&amp;xsd;string">lcc-m49</sm:fileAbbreviation>
      <owl:versionIRI>
        <xsl:attribute name="rdf:resource" select="'http://www.omg.org/spec/LCC/20170801/Countries/UN-M49-RegionCodes/'"/>         
      </owl:versionIRI> 
      <sm:fileAbstract rdf:datatype="&amp;xsd;string">This ontology represents the United Nations publication 'Standard Country or Area Codes for Statistical Use' originally published as Series M, No. 49 and now commonly referred to as the M49 standard. The assignment of countries or areas to specific groupings is for statistical convenience and does not imply any assumption regarding political or other affiliation of countries or territories by the United Nations. The codes included herein are current as of the version IRI for this ontology.</sm:fileAbstract>
      <dct:issued rdf:datatype="&amp;xsd;dateTime">
        <xsl:value-of select="'2017-08-03T22:26:02.631805+02:00'"/>         
      </dct:issued> 
      <xsl:value-of select="'&#x0A;&#x0A;'"/>
      <sm:dependsOn rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/Languages/LanguageRepresentation/</sm:dependsOn>
      <sm:dependsOn rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/Countries/CountryRepresentation/</sm:dependsOn>
      <sm:dependsOn rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/</sm:dependsOn>
     <xsl:value-of select="'&#x0A;&#x0A;'"/>        
      <sm:contentLanguage rdf:datatype="&amp;xsd;anyURI">http://www.w3.org/standards/techs/owl#w3c_all</sm:contentLanguage>
      <sm:contentLanguage rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/ODM/</sm:contentLanguage>
      <xsl:value-of select="'&#x0A;&#x0A;'"/>        
      <rdfs:seeAlso rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/AboutLCC/</rdfs:seeAlso>
      <rdfs:seeAlso rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/Countries/AboutCountries/</rdfs:seeAlso>        
      <xsl:value-of select="'&#x0A;&#x0A;'"/>
      <owl:imports rdf:resource="http://www.omg.org/spec/LCC/Languages/LanguageRepresentation/"/>
      <owl:imports rdf:resource="http://www.omg.org/spec/LCC/Countries/CountryRepresentation/"/>
      <owl:imports rdf:resource="http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/"/>
      <xsl:value-of select="'&#x0A;&#x0A;'"/>       
    </owl:Ontology>
    
    <xsl:call-template name="comment-block">
      <xsl:with-param name="the-text" select="'Individuals'"/>
    </xsl:call-template>
    <!-- The region kinds -->
    <owl:NamedIndividual rdf:about="&amp;lcc-m49;Planet">
      <rdf:type rdf:resource="&amp;lcc-cr;GeographicRegionKind"/>
      <rdfs:label>planet</rdfs:label>
      <skos:definition rdf:datatype="&xsd;string">the kind of region that is a planet</skos:definition>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="'&amp;lcc-m49;'"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual> 
    <owl:NamedIndividual rdf:about="&amp;lcc-m49;Continent">
     <rdf:type rdf:resource="&amp;lcc-cr;GeographicRegionKind"/>
     <rdfs:label>continent</rdfs:label>
     <skos:definition rdf:datatype="&xsd;string">the kind of region that is a continent</skos:definition>
     <rdfs:isDefinedBy>
       <xsl:attribute name="rdf:resource" select="'&amp;lcc-m49;'"/>
     </rdfs:isDefinedBy>
    </owl:NamedIndividual> 
   <owl:NamedIndividual rdf:about="&amp;lcc-m49;Region">
     <rdf:type rdf:resource="&amp;lcc-cr;GeographicRegionKind"/>
     <rdfs:label>region</rdfs:label>
     <skos:definition rdf:datatype="&xsd;string">the kind of region that is a region within a continent</skos:definition>
     <rdfs:isDefinedBy>
       <xsl:attribute name="rdf:resource" select="'&amp;lcc-m49;'"/>
     </rdfs:isDefinedBy>
   </owl:NamedIndividual> 
   <owl:NamedIndividual rdf:about="&amp;lcc-m49;Subregion">
     <rdf:type rdf:resource="&amp;lcc-cr;GeographicRegionKind"/>
     <rdfs:label>subregion</rdfs:label>
     <skos:definition rdf:datatype="&xsd;string">the kind of region that is a subregion</skos:definition>
     <rdfs:isDefinedBy>
       <xsl:attribute name="rdf:resource" select="'&amp;lcc-m49;'"/>
     </rdfs:isDefinedBy>
    </owl:NamedIndividual>  
  
    <!-- Main processing -->
    <xsl:apply-templates select="rdf:RDF/owl:NamedIndividual"/>
    <xsl:call-template name="comment-block">
      <xsl:with-param name="the-text" select="'Links from countries to their regions'"/>
    </xsl:call-template>
    <xsl:apply-templates select="rdf:RDF/rdf:Description"/>
  </rdf:RDF>
</xsl:template>

<xsl:template match="owl:NamedIndividual">
  <xsl:variable name="region-name" select="substring-after(@rdf:about, '&lcc-m49;')"/>
  <xsl:variable name="regionCamel">
    <xsl:call-template name="camelCase">
      <xsl:with-param name="inString" select="$region-name"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="parent-name" select="substring-after(lcc-cr:isSubregionOf/@rdf:resource, '&lcc-m49;')"/>
  <xsl:variable name="parentCamel">
    <xsl:call-template name="camelCase">
      <xsl:with-param name="inString" select="$parent-name"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="region-uri" select="concat($m49-base-uri, $regionCamel)"/> 
  <xsl:variable name="region-kind">
    <xsl:choose>
      <xsl:when test="skos:definition='IntermediateRegion'">Subregion</xsl:when>
      <xsl:when test="skos:definition='Subregion'">Region</xsl:when>
      <xsl:when test="skos:definition='Region'">Continent</xsl:when>
      <xsl:when test="skos:definition='Global'">Planet</xsl:when>
    </xsl:choose>
  </xsl:variable>
  <!-- Output -->
  <xsl:call-template name="comment-block">
    <xsl:with-param name="the-text"  select="rdfs:label"/>
  </xsl:call-template> 
  <owl:NamedIndividual>
    <xsl:attribute name="rdf:about" select="$region-uri"/>
    <rdf:type>
      <xsl:attribute name="rdf:resource" select="'&amp;lcc-cr;GeographicRegion'"/>
    </rdf:type>
    <xsl:copy-of select="rdfs:label"/>
    <skos:definition>
      <xsl:value-of select="concat('individual representing the ', lower-case($region-kind) ,' ', rdfs:label )"/>
    </skos:definition>
    <lcc-cr:isClassifiedBy>
      <xsl:attribute name="rdf:resource" select="concat('&amp;lcc-m49;',$region-kind)"/>
    </lcc-cr:isClassifiedBy>
    <lcc-cr:hasEnglishShortName rdf:datatype="&xsd;string" xml:lang="en">
      <xsl:value-of select="lcc-cr:hasEnglishShortName"/>
    </lcc-cr:hasEnglishShortName>
    <lcc-cr:hasNumericRegionCode rdf:datatype="&xsd;string" >
      <xsl:value-of select="lcc-cr:hasNumericRegionCode"/>
    </lcc-cr:hasNumericRegionCode>
    <xsl:if test="lcc-cr:isSubregionOf">
      <lcc-cr:isSubregionOf>
        <xsl:attribute name="rdf:resource" select="concat('&amp;lcc-m49;',$parentCamel)"/>
      </lcc-cr:isSubregionOf>     
    </xsl:if>
    <rdfs:isDefinedBy>
      <xsl:attribute name="rdf:resource" select="$m49-base-uri"/>
    </rdfs:isDefinedBy>
  </owl:NamedIndividual>
</xsl:template>
  
  <xsl:template match="rdf:Description">
    <!-- Triple linking from country in ISO-3166-1 ontology to a region in this ontology -->
    <!-- Need to replace alpha3 code by proper URI -->
    <xsl:variable name="code3" select="substring-after(@rdf:about, '&lcc-3166-1;')"/>
    <xsl:variable name="country-uri">
      <xsl:call-template name="lookup-country-uri">
        <xsl:with-param name="code3" select="$code3"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="region-name" select="substring-after(lcc-cr:isSubregionOf/@rdf:resource, '&lcc-m49;')"/>
    <xsl:variable name="regionCamel">
      <xsl:call-template name="camelCase">
        <xsl:with-param name="inString" select="$region-name"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:copy>
      <xsl:attribute name="rdf:about" select="$country-uri"/>
      <lcc-cr:isSubregionOf>
        <xsl:attribute name="rdf:resource" select="concat('&amp;lcc-m49;', $regionCamel)"/>
      </lcc-cr:isSubregionOf>     
    </xsl:copy>    
  </xsl:template>


<xsl:template match="*" priority="-1"/>

</xsl:stylesheet>