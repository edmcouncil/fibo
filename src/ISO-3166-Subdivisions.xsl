<?xml version="1.0"?>
<!DOCTYPE stylesheet [
  <!ENTITY xsd "http://www.w3.org/2001/XMLSchema#" >
  <!ENTITY rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#" >
  <!ENTITY dct "http://purl.org/dc/terms/" >
  <!ENTITY sm "http://www.omg.org/techprocess/ab/SpecificationMetadata/" >
  <!ENTITY lcc-lr "http://www.omg.org/spec/LCC/Languages/LanguageRepresentation/" >
  <!ENTITY lcc-cr "http://www.omg.org/spec/LCC/Countries/CountryRepresentation/" >
  <!ENTITY lcc-3166-1 "http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/" >
  <!ENTITY lcc-3166-2 "http://www.omg.org/spec/LCC/Countries/ISO3166-2-SubdivisionCodes/" >
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
xmlns:lcc-3166-2="http://www.omg.org/spec/LCC/Countries/ISO3166-2-SubdivisionCodes/"
exclude-result-prefixes="xsl xs">

  <!-- Converts iso_country_codes.xml file downloaded from ISO and for each country with subdivisions or territories
       generates a separate file with its subdivision kinds (categories) and the subdivisions/territories -->
  <!-- Also generates an 'about' file as the main output - which is a set of imports for the ontologies generated --> 
  <!-- Version IRI needs to be updated -->  

  <xsl:output method="xml" indent="yes" media-type="application/xml" use-character-maps="ampersand"/> 
  <xsl:strip-space elements="*"/>
  <!-- This is needed to allow use of XML entities such as &lcc-cr; in the output -->
  <xsl:character-map name="ampersand">
    <xsl:output-character character="&amp;" string="&#x26;"/>
  </xsl:character-map> 

<xsl:param name="destdir" select="'C:\Temp\Subdivisions'"/> <!-- The name of the output directory  --> <!-- Default is just for testing -->
<xsl:param name="owl-file-extension" select="'.rdf'"/> <!-- To add to the generated files -->
<xsl:param name="generate-entities" select="'false'"/> <!-- Whether to use XML entities - requires sepsrate mappign file described below -->
<xsl:variable name="base-dir" select="concat('file:///', translate($destdir, '\', '/'), '/')"/> 
<xsl:variable name="countries-base-uri" select="'&amp;lcc-3166-1;'"/>
<xsl:variable name="subdivisions-base-uri" select="'http://www.omg.org/spec/LCC/Countries/Regions/ISO3166-2-SubdivisionCodes-'"/>

<xsl:key name="country-key" match="country" use="@id"/>

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

<!-- Turns a string into camelcase.  -->
<xsl:template name="camelCase">
	<xsl:param name="inString" select="@name"/>
  <xsl:variable name="intermed">
    <xsl:for-each select="tokenize($inString, '\s+')">
      <xsl:value-of select="concat(upper-case(substring(., 1, 1)), substring(., 2))"/>
    </xsl:for-each>
  </xsl:variable>
  <!-- Stop at the first punctuation -->
  <!-- Stop at the first punctuation -->
  <xsl:variable name="asciiString" select="replace(normalize-unicode($intermed, 'NFD'), '\P{IsBasicLatin}', '')"/>
  <xsl:variable name="noAposDotString" select="translate($asciiString, '&apos;&apos;.', '')"/>
  <xsl:variable name="cleanString" select="replace($noAposDotString, '([-0-9a-zA-Z]+)(.*)', '$1')"/>
  <xsl:value-of select="$cleanString"/>
</xsl:template>

<xsl:template name="doLabels">
  <!-- Specifically process English, French, Local short names -->
  <xsl:for-each select="subdivision-locale">
    <xsl:choose>
      <xsl:when test="@lang3code='eng'">
        <lcc-cr:hasEnglishShortName rdf:datatype="&amp;xsd;string">
          <xsl:copy-of select="@xml:lang"/>
          <xsl:value-of select="subdivision-locale-name"/>
        </lcc-cr:hasEnglishShortName>
      </xsl:when>
      <xsl:when test="@lang3code='fra'">
        <lcc-cr:hasFrenchShortName rdf:datatype="&amp;xsd;string">
          <xsl:copy-of select="@xml:lang"/>
          <xsl:value-of select="subdivision-locale-name"/>
        </lcc-cr:hasFrenchShortName>
      </xsl:when>
      <xsl:otherwise>
        <lcc-cr:hasLocalShortName rdf:datatype="&amp;xsd;string">
          <xsl:copy-of select="@xml:lang"/>
          <xsl:value-of select="subdivision-locale-name"/>
        </lcc-cr:hasLocalShortName>    
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>
  
  <xsl:template name="doTerritoryLabels">
    <!-- Specifically process English, French, Local short names -->
    <!-- Assume the names provided are the short names -->
    <xsl:for-each select="territory-name">
      <xsl:choose>
        <xsl:when test="@lang3code='eng'">
          <lcc-cr:hasEnglishShortName rdf:datatype="&amp;xsd;string">
            <xsl:copy-of select="@xml:lang"/>
            <xsl:value-of select="normalize-space(.)"/>
          </lcc-cr:hasEnglishShortName>
        </xsl:when>
        <xsl:when test="@lang3code='fra'">
          <lcc-cr:hasFrenchShortName rdf:datatype="&amp;xsd;string">
            <xsl:copy-of select="@xml:lang"/>
            <xsl:value-of select="normalize-space(.)"/>
          </lcc-cr:hasFrenchShortName>
        </xsl:when>
        <xsl:otherwise>
          <lcc-cr:hasLocalShortName rdf:datatype="&amp;xsd;string">
            <xsl:copy-of select="@xml:lang"/>
            <xsl:value-of select="normalize-space(.)"/>
          </lcc-cr:hasLocalShortName>    
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>


<xsl:template match="/">
  <!-- Ontology here is root element for the about file. It will need boilerplate adding -->
  <rdf:RDF>
    <owl:Ontology rdf:about="http://www.omg.org/spec/LCC/1.0/AboutLCC-1.0-Regions/">
      <xsl:apply-templates select="country-codes/country"/>
    </owl:Ontology>
  </rdf:RDF>
</xsl:template>

<!-- Will ignore countries with no subdivisions or territories -->
<xsl:template match="country[subdivision | territory]">
  <!-- make use of directory structure from uuid for files output. Use shortcut for OMG standards -->
  <xsl:variable name="country-name">
    <!-- Prefer English -->
    <xsl:choose>
      <xsl:when test="@id='CC'">Cocos Keeling Islands</xsl:when>
      <xsl:when test="@id='CD'">Congo Democratic Republic Of</xsl:when>
      <xsl:when test="@id='KP'">Korea Democratic Peoples Republic Of</xsl:when>
      <xsl:when test="@id='KR'">Korea Republic Of</xsl:when>
      <xsl:when test="@id='VG'">Virgin Islands British</xsl:when>
      <xsl:when test="@id='VI'">Virgin Islands US</xsl:when>
      <xsl:when test="short-name[@lang3code='eng']">
        <xsl:value-of select="short-name[@lang3code='eng']"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="short-name[1]"/>       
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="countryCamel">
    <xsl:call-template name="camelCase">
      <xsl:with-param name="inString" select="$country-name"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="country2" select="alpha-2-code"/>
  <xsl:variable name="filelast" select="concat('ISO3166-2-SubdivisionCodes-',$country2, $owl-file-extension)"/> 
  <xsl:variable name="filename" select="concat($base-dir, $filelast)"/>
  <xsl:variable name="country-uri" select="concat($countries-base-uri, $countryCamel)"/>
  <xsl:variable name="subdivs-ont-uri" select="concat($subdivisions-base-uri, alpha-2-code, '/')"/>
  <xsl:variable name="subdivs-ont-abbrev" select="concat('lcc-3166-2-', lower-case(alpha-2-code))"/>
  <xsl:variable name="subdivs-ont-entity" select="concat('&amp;', $subdivs-ont-abbrev, ';')"/>
 
  <xsl:message select="concat('Writing to file: ', $filename, ' with base uri: ', $subdivs-ont-uri)"/> 
  <!-- Output a set of imports for About file -->
  <owl:imports>
    <xsl:attribute name="rdf:resource" select="$subdivs-ont-uri"/>
  </owl:imports>
  
  <xsl:result-document href="{$filename}" indent="yes"> 
<!-- Output the XML entities needed, based on all the references needed 
  -->
<xsl:text disable-output-escaping="yes"> 
<![CDATA[<!DOCTYPE rdf:RDF [
    <!ENTITY xsd "http://www.w3.org/2001/XMLSchema#" >
    <!ENTITY rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#" >
    <!ENTITY dct "http://purl.org/dc/terms/" >
    <!ENTITY sm "http://www.omg.org/techprocess/ab/SpecificationMetadata/" >
    <!ENTITY lcc-lr "http://www.omg.org/spec/LCC/Languages/LanguageRepresentation/" >
    <!ENTITY lcc-cr "http://www.omg.org/spec/LCC/Countries/CountryRepresentation/" >
    <!ENTITY lcc-3166-1 "http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/" >
    <!ENTITY lcc-3166-2 "http://www.omg.org/spec/LCC/Countries/ISO3166-2-SubdivisionCodes/" >
    <!ENTITY ]]></xsl:text>    
  <xsl:value-of select="concat($subdivs-ont-abbrev, ' &quot;',$subdivs-ont-uri, '&quot;')"/>
  <xsl:text disable-output-escaping="yes"><![CDATA[ >
]>]]>
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
       xmlns:lcc-3166-2="http://www.omg.org/spec/LCC/Countries/ISO3166-2-SubdivisionCodes/">
      <xsl:attribute name="xml:base" select="$subdivs-ont-uri"/>
      
      <xsl:namespace name="{$subdivs-ont-abbrev}" select="$subdivs-ont-uri"></xsl:namespace>
      <xsl:call-template name="comment-block">
        <xsl:with-param name="the-text"  select="concat('Subdivisions of ' , $country-name)"/>
      </xsl:call-template>
      <owl:Ontology>
        <xsl:attribute name="rdf:about" select="$subdivs-ont-uri"/>
        <rdfs:label>
          <xsl:value-of select="concat(' ISO 3166-2 Subdivision Codes for ', $country-name, ' Ontology')"/>
        </rdfs:label>
        <xsl:value-of select="'&#x0A;&#x0A;'"/>
        <xsl:comment>
            <xsl:value-of select="concat(' Curation and Rights Metadata for the LCC ISO 3166-2 Subdivision Codes for ', $country-name, ' Ontology ')"/>
        </xsl:comment>
        <xsl:value-of select="'&#x0A;&#x0A;'"/>
        <sm:copyright rdf:datatype="&amp;xsd;string">Copyright (c) 2015-2017 Object Management Group, Inc.
          Copyright (c) 2015-2017 Adaptive Inc.
          Copyright (c) 2015-2017 Thematix Partners LLC
          Copyright (c) 2015-2017 Unisys
        </sm:copyright>
        <dct:license rdf:resource="&amp;sm;MITLicense"/>       
        <xsl:value-of select="'&#x0A;&#x0A;'"/>
        <xsl:comment>
            <xsl:value-of select="concat(' Ontology/File-Level Metadata for the LCC ISO 3166-2 Subdivision Codes for ', $country-name, ' Ontology ')"/>
        </xsl:comment>
        <xsl:value-of select="'&#x0A;&#x0A;'"/>
        <sm:filename rdf:datatype="&amp;xsd;string">
          <xsl:value-of select="$filelast"/>
        </sm:filename>
        <sm:fileAbbreviation rdf:datatype="&amp;xsd;string">
          <xsl:value-of select="$subdivs-ont-abbrev"/>
        </sm:fileAbbreviation>
        <owl:versionIRI>
          <xsl:attribute name="rdf:resource" select="concat(substring-before($subdivs-ont-uri, 'Countries'), '20170801/', substring-after($subdivs-ont-uri, 'LCC/'))"/>         
        </owl:versionIRI> 
        <sm:fileAbstract rdf:datatype="&amp;xsd;string">
          <xsl:value-of select="concat('This ontology represents the subset of the ISO 3166 standard that includes the actual ISO 3166-2 subdivision codes for ', $country-name, ', with the ontology and codes for the other parts of the standard represented in models that this ontology depends on.')"/>
        </sm:fileAbstract>       
        <dct:issued rdf:datatype="&amp;xsd;dateTime">
          <xsl:value-of select="/country-codes/@generated"/>         
        </dct:issued> 
        <xsl:value-of select="'&#x0A;&#x0A;'"/>
        <sm:dependsOn rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/Languages/LanguageRepresentation/</sm:dependsOn>
        <sm:dependsOn rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/Countries/CountryRepresentation/</sm:dependsOn>
        <sm:dependsOn rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/</sm:dependsOn>
        <sm:dependsOn rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/Countries/ISO3166-2-SubdivisionCodes/</sm:dependsOn>
        <xsl:value-of select="'&#x0A;&#x0A;'"/>        
        <sm:contentLanguage rdf:datatype="&amp;xsd;anyURI">http://www.w3.org/standards/techs/owl#w3c_all</sm:contentLanguage>
        <sm:contentLanguage rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/ODM/</sm:contentLanguage>
        <xsl:value-of select="'&#x0A;&#x0A;'"/>        
        <rdfs:seeAlso rdf:resource="http://www.omg.org/spec/LCC/AboutLCC/"/>
        <rdfs:seeAlso rdf:resource="http://www.omg.org/spec/LCC/Countries/AboutCountries/"/>        
        <xsl:value-of select="'&#x0A;&#x0A;'"/>
        <owl:imports rdf:resource="http://www.omg.org/spec/LCC/Languages/LanguageRepresentation/"/>
        <owl:imports rdf:resource="http://www.omg.org/spec/LCC/Countries/CountryRepresentation/"/>
        <owl:imports rdf:resource="http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/"/>
        <owl:imports rdf:resource="http://www.omg.org/spec/LCC/Countries/ISO3166-2-SubdivisionCodes/"/>
        <xsl:value-of select="'&#x0A;&#x0A;'"/>       
      </owl:Ontology>
      
      <xsl:call-template name="comment-block">
        <xsl:with-param name="the-text" select="'Category (Subdivision Type) Individuals'"/>
      </xsl:call-template>
      <xsl:for-each select="category">
        <xsl:variable name="category-name">
          <!-- Prefer English -->
          <xsl:choose>
            <xsl:when test="category-name[@lang3code='eng']">
              <xsl:value-of select="category-name[@lang3code='eng']"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="category-name"/>       
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="category-camel">
          <xsl:call-template name="camelCase">
            <xsl:with-param name="inString" select="$category-name"/>
          </xsl:call-template>
        </xsl:variable>
        <owl:NamedIndividual>
          <xsl:attribute name="rdf:about" select="concat($subdivs-ont-entity, $category-camel)"/>     
          <rdf:type>
            <xsl:attribute name="rdf:resource" select="'&amp;lcc-cr;GeographicRegionKind'"/>
          </rdf:type>
          <rdfs:label>
            <xsl:value-of select="$category-name"/>
          </rdfs:label>
          <skos:definition>
            <xsl:value-of select="concat('subdivision category ', $category-name, ' in the country of ', $country-name )"/>
          </skos:definition>
          <rdfs:isDefinedBy>
            <xsl:attribute name="rdf:resource" select="$subdivs-ont-entity"/>
          </rdfs:isDefinedBy>         
        </owl:NamedIndividual>
        <xsl:value-of select="'&#x0A;&#x0A;'"/>       
      </xsl:for-each>  
      <xsl:call-template name="comment-block">
        <xsl:with-param name="the-text" select="'Subdivision Individuals'"/>
      </xsl:call-template>
      
      <xsl:apply-templates select="subdivision">
        <xsl:with-param name="country-name" select="$country-name"/>
        <xsl:with-param name="country-uri" select="$country-uri"/>
        <xsl:with-param name="subdivs-ont-entity" select="$subdivs-ont-entity"/>
      </xsl:apply-templates>
      <xsl:apply-templates select="territory">
        <xsl:with-param name="country-name" select="$country-name"/>
        <xsl:with-param name="country-uri" select="$country-uri"/>
        <xsl:with-param name="subdivs-ont-entity" select="$subdivs-ont-entity"/>
      </xsl:apply-templates>
    </rdf:RDF>
  </xsl:result-document>
</xsl:template>
  
  <xsl:template match="subdivision">
    <xsl:param name="country-name"/>
    <xsl:param name="country-uri"/>
    <xsl:param name="subdivs-ont-entity"/>
    <xsl:param name="parent-uri"/>
    <!-- Subdivision -->
    <!-- Set up a bunch of variables -->
    <xsl:variable name="name">
      <!-- Prefer English -->
      <xsl:choose>
         <xsl:when test="subdivision-locale[@lang3code='eng']/subdivision-locale-name">
          <xsl:value-of select="subdivision-locale[@lang3code='eng']/subdivision-locale-name"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="subdivision-locale[1]/subdivision-locale-name"/>       
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="cat-id" select="@category-id"/>
    <xsl:variable name="category" as="element()" select="preceding::category[@id=$cat-id]"/>
    <xsl:variable name="cat-name">
      <!-- Prefer English -->
      <xsl:choose>
        <xsl:when test="$category/category-name[@lang3code='eng']">
          <xsl:value-of select="$category/category-name[@lang3code='eng']"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$category/category-name[1]"/>       
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="cat-camel">
      <xsl:call-template name="camelCase">
        <xsl:with-param name="inString" select="$cat-name"/>
      </xsl:call-template>
    </xsl:variable>   
    <xsl:variable name="subdivCamel1">
      <xsl:choose>
        <!-- hard-coded disambiguation -->
        <xsl:when test="subdivision-code='AZ-SA'">Ski-Municipality</xsl:when>
        <xsl:when test="subdivision-code='AZ-YE'">Yevlax-Municipality</xsl:when>
        <xsl:when test="subdivision-code='AZ-LA'">Lnkran-Municipality</xsl:when>
        <xsl:when test="subdivision-code='BG-22'">SofiaStolitsa</xsl:when>
        <xsl:when test="subdivision-code='HU-VM'">Veszprem-City</xsl:when>
        <xsl:when test="subdivision-code='LA-VT'">Viangchan-Prefecture</xsl:when>
        <xsl:when test="subdivision-code='MU-PU'">PortLouis-City</xsl:when>
        <xsl:when test="subdivision-code='MZ-MPM'">Maputo-City</xsl:when>
        <xsl:when test="subdivision-code='TW-HSZ'">Hsinchu-City</xsl:when>
        <xsl:when test="subdivision-code='TW-CYI'">Chiayi-City</xsl:when>
        <xsl:when test="subdivision-code='UZ-TK'">Toshkent-City</xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="camelCase">
            <xsl:with-param name="inString" select="$name"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="subdivCamel">
      <xsl:choose>
        <xsl:when test="concat($subdivs-ont-entity, $subdivCamel1) = $parent-uri">
          <!-- Avoid having same URI as parent - add the category name -->
          <xsl:value-of select="concat($subdivCamel1, '-', $cat-camel)"/>        
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$subdivCamel1"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="subdiv-uri" select="concat($subdivs-ont-entity, $subdivCamel)"/>
    <!-- Output -->
    <xsl:call-template name="comment-block">
      <xsl:with-param name="the-text"  select="$name"/>
    </xsl:call-template> 
    <owl:NamedIndividual>
      <xsl:attribute name="rdf:about" select="$subdiv-uri"/>
      <rdf:type>
        <xsl:attribute name="rdf:resource" select="'&amp;lcc-cr;CountrySubdivision'"/>
      </rdf:type>
      <rdfs:label>
        <xsl:value-of select="$name"/>
      </rdfs:label>
      <skos:definition>
        <xsl:value-of select="concat('The ', $cat-name, ' of ', $name, ' in the country of ', $country-name )"/>
      </skos:definition>
      <lcc-cr:isSubregionOf>
        <xsl:attribute name="rdf:resource">
          <xsl:choose>
            <xsl:when test="parent::subdivision">
              <xsl:value-of select="$parent-uri"/>             
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$country-uri"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </lcc-cr:isSubregionOf>
      <xsl:choose>
        <xsl:when test="subdivision-related-country">
         <owl:sameAs>
           <xsl:variable name="country" as="element()" select="key('country-key', subdivision-related-country/@country-id)"/>
           <xsl:variable name="country-name">
             <!-- Prefer English -->
             <xsl:choose>
               <xsl:when test="$country/@id='CC'">Cocos Keeling Islands</xsl:when>
               <xsl:when test="$country/@id='CD'">Congo Democratic Republic Of</xsl:when>
               <xsl:when test="$country/@id='KP'">Korea Democratic Peoples Republic Of</xsl:when>
               <xsl:when test="$country/@id='KR'">Korea Republic Of</xsl:when>
               <xsl:when test="$country/@id='VG'">Virgin Islands British</xsl:when>
               <xsl:when test="$country/@id='VI'">Virgin Islands US</xsl:when>
               <xsl:when test="$country/short-name[@lang3code='eng']">
                 <xsl:value-of select="$country/short-name[@lang3code='eng']"/>
               </xsl:when>
               <xsl:otherwise>
                 <xsl:value-of select="$country/short-name[1]"/>       
               </xsl:otherwise>
             </xsl:choose>
           </xsl:variable>
           <xsl:variable name="countryCamel">
             <xsl:call-template name="camelCase">
               <xsl:with-param name="inString" select="$country-name"/>
             </xsl:call-template>
           </xsl:variable>
           <xsl:attribute name="rdf:resource" select="concat($countries-base-uri, $countryCamel)"/> 
         </owl:sameAs>
        </xsl:when>
        <xsl:otherwise>
          <!-- Only process labels if there is no sameAs - otherwise the item will have 2 names which violates cardinality restriction -->          
          <xsl:call-template name="doLabels"/>          
        </xsl:otherwise>
      </xsl:choose>
      <lcc-cr:isClassifiedBy>
        <xsl:attribute name="rdf:resource" select="concat($subdivs-ont-entity, $cat-camel)"/>     
      </lcc-cr:isClassifiedBy>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$subdivs-ont-entity"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>

    <!-- Now the code -->
    <xsl:value-of select="'&#x0A;&#x0A;'"/>       
    <owl:NamedIndividual>
      <xsl:attribute name="rdf:about" select="concat($subdivs-ont-entity, subdivision-code)"/>
      <rdf:type rdf:resource="&amp;lcc-cr;GeographicRegionIdentifier"/>
      <skos:definition>
        <xsl:value-of select="concat('subdivision code for the ', $cat-name, ' of ', $name, ' in the country of ', $country-name )"/>
      </skos:definition>
      <rdfs:label>
        <xsl:value-of select="subdivision-code"/>
      </rdfs:label>
      <lcc-lr:hasTag rdf:datatype="&amp;xsd;string">
        <xsl:value-of select="subdivision-code"/>
      </lcc-lr:hasTag>
      <lcc-lr:denotes>
        <xsl:attribute name="rdf:resource" select="$subdiv-uri"/>                
      </lcc-lr:denotes>
      <lcc-lr:identifies>
        <xsl:attribute name="rdf:resource" select="$subdiv-uri"/>                           
      </lcc-lr:identifies>
      <lcc-lr:isMemberOf rdf:resource="&amp;lcc-3166-2;ISO3166-2-CodeSet"/>         
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$subdivs-ont-entity"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>
    <xsl:apply-templates select="subdivision">
      <xsl:with-param name="country-name" select="$country-name"/>
      <xsl:with-param name="country-uri" select="$country-uri"/>
      <xsl:with-param name="subdivs-ont-entity" select="$subdivs-ont-entity"/>
      <xsl:with-param name="parent-uri" select="$subdiv-uri"/>
    </xsl:apply-templates>
  <xsl:value-of select="'&#x0A;&#x0A;'"/>
 </xsl:template>
  
  <xsl:template match="territory">
    <!-- These do not have an alpha code but do have a 4 character numeric id -->
    <xsl:param name="country-name"/>
    <xsl:param name="country-uri"/>
    <xsl:param name="subdivs-ont-entity"/>
    <xsl:param name="parent-uri"/>
    <!-- Territory -->
    <!-- Set up a bunch of variables -->
    <xsl:variable name="name">
      <!-- Prefer English -->
      <xsl:choose>
        <xsl:when test="territory-name[@lang3code='eng']">
          <xsl:value-of select="normalize-space(territory-name[@lang3code='eng'])"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="normalize-space(territory-name[1])"/>       
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="subdivCamel">
          <xsl:call-template name="camelCase">
            <xsl:with-param name="inString" select="$name"/>
          </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="subdiv-uri" select="concat($subdivs-ont-entity, $subdivCamel)"/>
    <!-- Output -->
    <xsl:call-template name="comment-block">
      <xsl:with-param name="the-text"  select="$name"/>
    </xsl:call-template> 
    <owl:NamedIndividual>
      <xsl:attribute name="rdf:about" select="$subdiv-uri"/>
      <rdf:type>
        <xsl:attribute name="rdf:resource" select="'&amp;lcc-cr;Territory'"/>
      </rdf:type>
      <rdfs:label>
        <xsl:value-of select="$name"/>
      </rdfs:label>
      <skos:definition>
        <xsl:value-of select="concat('The territory of ', $name, ' in the country of ', $country-name )"/>
      </skos:definition>
      <lcc-cr:hasNumericRegionCode rdf:datatype="&amp;xsd;string">
        <xsl:value-of select="@id"/>
      </lcc-cr:hasNumericRegionCode>
      <xsl:call-template name="doTerritoryLabels"/>
      <lcc-cr:isSubregionOf>
        <xsl:attribute name="rdf:resource">
          <xsl:choose>
            <xsl:when test="parent::subdivision">
              <xsl:value-of select="$parent-uri"/>             
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="$country-uri"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </lcc-cr:isSubregionOf>
      <lcc-cr:isClassifiedBy rdf:resource="&amp;lcc-3166-2;Territory"/>     
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$subdivs-ont-entity"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>
  </xsl:template>    

<xsl:template match="*" priority="-1"/>

</xsl:stylesheet>