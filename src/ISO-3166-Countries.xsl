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

<!-- Converts iso_country_codes.xml file downloaded from ISO and generates one ontology with all the countries -->
<!-- Requires the LCC Languages ontology file ISO639-2-LanguageCodes.rdf to be in the same directory -->  
<!-- Version IRI needs to be updated -->  

  <xsl:output method="xml" indent="yes" media-type="application/xml" use-character-maps="ampersand"/> 
  <xsl:strip-space elements="*"/>
  <!-- This is needed to allow use of XML entities such as &lcc-cr; in the output -->
  <xsl:character-map name="ampersand">
    <xsl:output-character character="&amp;" string="&#x26;"/>
  </xsl:character-map> 

  <xsl:variable name="countries-base-uri" select="'&amp;lcc-3166-1;'"/>

<!-- Need to consult the ontology file for language codes in order to construct the language URIs -->
<!-- Assume file is local -->
  <xsl:variable name="languages" select="document('ISO639-2-LanguageCodes.rdf')/rdf:RDF/owl:NamedIndividual"/>  

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

<!-- Turns a string into camelcase  -->
  <xsl:template name="camelCase">
    <xsl:param name="inString" select="@name"/>
    <xsl:variable name="intermed">
      <xsl:for-each select="tokenize($inString, '\s+')">
        <xsl:value-of select="concat(upper-case(substring(., 1, 1)), substring(., 2))"/>
      </xsl:for-each>
    </xsl:variable>
    <!-- Stop at the first punctuation -->
    <xsl:variable name="asciiString" select="replace(normalize-unicode($intermed, 'NFD'), '\P{IsBasicLatin}', '')"/>
    <xsl:variable name="noAposDotString" select="translate($asciiString, '&apos;&apos;.', '')"/>
    <xsl:variable name="cleanString" select="replace($noAposDotString, '([-0-9a-zA-Z]+)(.*)', '$1')"/>
    <xsl:value-of select="$cleanString"/>
  </xsl:template>

<!-- Looks up language URI given 3 character code -->
<xsl:template name="lookup-lang-uri">
  <xsl:param name="code3" select="language-alpha-3-code"/>
  <xsl:variable name="uri" select="$languages[rdfs:label=$code3]/lcc-lr:denotes/@rdf:resource"/>
  <xsl:choose>
    <!-- Messing around to force use of XML entry in reference -->
    <xsl:when test="starts-with($uri, '&lcc-639-1;')">&amp;lcc-639-1;<xsl:value-of select="substring-after($uri,'&lcc-639-1;')"/>
    </xsl:when>
    <xsl:when test="starts-with($uri, '&lcc-639-2;')">&amp;lcc-639-2;<xsl:value-of select="substring-after($uri,'&lcc-639-2;')"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message select="concat('Warning, unable to lookup language code ', $code3, '. Making use of known exceptions.')"/>
      <xsl:choose>
        <xsl:when test="$code3='001'">&amp;lcc-3166-1;Montenegrin</xsl:when>
        <xsl:when test="$code3='002'">&amp;lcc-3166-1;Shikomor</xsl:when>
        <xsl:when test="$code3='crs'">&amp;lcc-3166-1;SeselwaCreoleFrench</xsl:when>
        <xsl:otherwise>&amp;lcc-639-2;Undetermined</xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
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
    <!ENTITY lcc-639-1 "http://www.omg.org/spec/LCC/Languages/ISO639-1-LanguageCodes/" >
    <!ENTITY lcc-639-2 "http://www.omg.org/spec/LCC/Languages/ISO639-2-LanguageCodes/" >
    <!ENTITY lcc-cr "http://www.omg.org/spec/LCC/Countries/CountryRepresentation/" >
    <!ENTITY lcc-3166-1 "http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/" >
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
    xmlns:lcc-639-1="http://www.omg.org/spec/LCC/Languages/ISO639-1-LanguageCodes/"
    xmlns:lcc-639-2="http://www.omg.org/spec/LCC/Languages/ISO639-2-LanguageCodes/"
    xmlns:lcc-cr="http://www.omg.org/spec/LCC/Countries/CountryRepresentation/"
    xmlns:lcc-3166-1="http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/"
    xml:base="http://www.omg.org/spec/LCC/Countries/ISO3166-1-CountryCodes/">
    
  <xsl:value-of select="'&#x0A;&#x0A;'"/>
  <owl:Ontology>
      <!-- Boiler plate -->
      <xsl:attribute name="rdf:about" select="$countries-base-uri"/>
      <rdfs:label>ISO 3166-1 Country Codes Ontology</rdfs:label>
      <xsl:value-of select="'&#x0A;&#x0A;'"/>
      <xsl:comment>Curation and Rights Metadata for the LCC ISO 3166-1 Country Codes Ontology </xsl:comment>
      <xsl:value-of select="'&#x0A;&#x0A;'"/>
      <sm:copyright rdf:datatype="&amp;xsd;string">Copyright (c) 2015-2017 Object Management Group, Inc.
        Copyright (c) 2015-2017 Adaptive Inc.
        Copyright (c) 2015-2017 Thematix Partners LLC
        Copyright (c) 2015-2017 Unisys
      </sm:copyright>
      <dct:license rdf:datatype="&amp;xsd;anyURI">&sm;MITLicense</dct:license>       
      <xsl:value-of select="'&#x0A;&#x0A;'"/>
      <xsl:comment>Ontology/File-Level Metadata for the LCC ISO 3166-1 Country Codes Ontology </xsl:comment>
      <xsl:value-of select="'&#x0A;&#x0A;'"/>
      <sm:filename rdf:datatype="&amp;xsd;string">ISO3166-1-CountryCodes.rdf</sm:filename>
      <sm:fileAbbreviation rdf:datatype="&amp;xsd;string">lcc-3166-1</sm:fileAbbreviation>
      <owl:versionIRI>
        <xsl:attribute name="rdf:resource" select="'http://www.omg.org/spec/LCC/20170801/Countries/ISO3166-1-CountryCodes/'"/>         
      </owl:versionIRI> 
      <sm:fileAbstract rdf:datatype="&amp;xsd;string">This ontology represents the subset of the ISO 3166 standard that include the actual ISO 3166-1 country codes, with the ontology and codes for the other parts of the standard represented in dependent models.</sm:fileAbstract>
      <skos:changeNote rdf:datatype="&amp;xsd;string">The http://www.omg.org/spec/LCC/20151101/Countries/ISO3166-1-CountryCodes.rdf version of this ontology has been revised to reflect the issues addressed by the LCC 1.0 FTF report.  The country codes and related metadata contained herein are current as of the July 2017 revision to the online code set.</skos:changeNote>
      <dct:issued rdf:datatype="&amp;xsd;dateTime">
        <xsl:value-of select="/country-codes/@generated"/>         
      </dct:issued> 
      <xsl:value-of select="'&#x0A;&#x0A;'"/>
      <sm:dependsOn rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/Languages/LanguageRepresentation/</sm:dependsOn>
      <sm:dependsOn rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/Countries/CountryRepresentation/</sm:dependsOn>
      <xsl:value-of select="'&#x0A;&#x0A;'"/>        
      <sm:contentLanguage rdf:datatype="&amp;xsd;anyURI">http://www.w3.org/standards/techs/owl#w3c_all</sm:contentLanguage>
      <sm:contentLanguage rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/ODM/</sm:contentLanguage>
      <xsl:value-of select="'&#x0A;&#x0A;'"/>        
      <rdfs:seeAlso rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/AboutLCC/</rdfs:seeAlso>
      <rdfs:seeAlso rdf:datatype="&amp;xsd;anyURI">http://www.omg.org/spec/LCC/Countries/AboutCountries/</rdfs:seeAlso>        
      <xsl:value-of select="'&#x0A;&#x0A;'"/>
      <owl:imports rdf:resource="http://www.omg.org/spec/LCC/Languages/LanguageRepresentation/"/>
      <owl:imports rdf:resource="http://www.omg.org/spec/LCC/Countries/CountryRepresentation/"/>
      <xsl:value-of select="'&#x0A;&#x0A;'"/>       
    </owl:Ontology>
    
    <xsl:call-template name="comment-block">
      <xsl:with-param name="the-text" select="'Individuals'"/>
    </xsl:call-template>
    <!-- The code sets -->
    <owl:NamedIndividual rdf:about="&amp;lcc-3166-1;ISO3166-1-Alpha3-CodeSet">
      <rdf:type rdf:resource="&amp;lcc-lr;CodeSet"/>
      <rdf:type rdf:resource="&amp;lcc-lr;IdentificationScheme"/>
      <rdfs:label>ISO 3166-1 code set</rdfs:label>
      <skos:definition rdf:datatype="&amp;xsd;string">the set of country identifiers that comprise the 3 character codes in the ISO 3166-1 specification</skos:definition>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>
    <owl:NamedIndividual rdf:about="&amp;lcc-3166-1;ISO3166-1-Alpha2-CodeSet">
      <rdf:type rdf:resource="&amp;lcc-lr;CodeSet"/>
      <rdf:type rdf:resource="&amp;lcc-lr;IdentificationScheme"/>
      <rdfs:label>ISO 3166-1 code set</rdfs:label>
      <skos:definition rdf:datatype="&amp;xsd;string">the set of country identifiers that comprise the 2 character codes in the ISO 3166-1 specification</skos:definition>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>
    <xsl:value-of select="'&#x0A;&#x0A;'"/>
    <owl:NamedIndividual rdf:about="&amp;lcc-3166-1;Country">
      <rdf:type rdf:resource="&lcc-cr;GeographicRegionKind"/>
      <rdfs:label>Country</rdfs:label>
      <skos:definition rdf:datatype="&amp;xsd;string">the kind of region that is a country</skos:definition>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual> 
    <xsl:value-of select="'&#x0A;&#x0A;'"/>
    <!-- For legacy references -->
    <xsl:comment> Support for legacy reference using identifiers UnitedStates, UnitedKingdom and CzechRepublic</xsl:comment>
    <xsl:value-of select="'&#x0A;&#x0A;'"/>
    <owl:NamedIndividual rdf:about="&amp;lcc-3166-1;UnitedStates">
      <rdf:type rdf:resource="&lcc-cr;Country"/>
      <owl:sameAs rdf:resource="&amp;lcc-3166-1;UnitedStatesOfAmerica"/>
      <rdfs:comment>UnitedStates is supported as legacy identifier for UnitedStatesOfAmerica</rdfs:comment>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>
    <xsl:value-of select="'&#x0A;&#x0A;'"/>
    <owl:NamedIndividual rdf:about="&amp;lcc-3166-1;UnitedKingdom">
      <rdf:type rdf:resource="&lcc-cr;Country"/>
      <owl:sameAs rdf:resource="&amp;lcc-3166-1;UnitedKingdomOfGreatBritainAndNorthernIreland"/>
      <rdfs:comment>UnitedKingdom is supported as legacy identifier for UnitedKingdomOfGreatBritainAndNorthernIreland</rdfs:comment>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>
    <xsl:value-of select="'&#x0A;&#x0A;'"/>
    <owl:NamedIndividual rdf:about="&amp;lcc-3166-1;CzechRepublic">
      <rdf:type rdf:resource="&lcc-cr;Country"/>
      <owl:sameAs rdf:resource="&amp;lcc-3166-1;Czechia"/>
      <rdfs:comment>CzechRepublic is supported as legacy identifier for Czechia</rdfs:comment>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>
  <!-- Languages not covered by ISO 631-1 or 639-2 -->
    <xsl:value-of select="'&#x0A;&#x0A;'"/>
    <xsl:comment> Languages not covered by ISO 631-1 or 639-2 </xsl:comment>
    <xsl:value-of select="'&#x0A;&#x0A;'"/>
    <owl:NamedIndividual rdf:about="&amp;lcc-3166-1;Montenegrin">
      <rdf:type rdf:resource="&lcc-lr;IndividualLanguage"/>
      <rdf:type rdf:resource="&lcc-lr;LivingLanguage"/>
      <rdfs:label>Montenegrin</rdfs:label>
      <skos:definition rdf:datatype="&xsd;string">Montenegrin language</skos:definition>
      <lcc-lr:hasEnglishName rdf:datatype="&xsd;string">Montenegrin</lcc-lr:hasEnglishName>
      <rdfs:comment>Not yet allocated a code in ISO 639</rdfs:comment>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>
    <owl:NamedIndividual rdf:about="&amp;lcc-3166-1;L001">
      <rdf:type rdf:resource="&lcc-lr;IndividualLanguageIdentifier"/>
      <rdfs:label>001</rdfs:label>
      <skos:definition rdf:datatype="&xsd;string">Alpha-3 language code for Montenegrin</skos:definition>
      <lcc-lr:hasTag rdf:datatype="&xsd;string">001</lcc-lr:hasTag>
      <lcc-lr:denotes rdf:resource="&amp;lcc-3166-1;Montenegrin"/>
      <lcc-lr:identifies rdf:resource="&amp;lcc-3166-1;Montenegrin"/>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>
  
    <xsl:value-of select="'&#x0A;&#x0A;'"/>
    <owl:NamedIndividual rdf:about="&amp;lcc-3166-1;Shikomor">
      <rdf:type rdf:resource="&lcc-lr;IndividualLanguage"/>
      <rdf:type rdf:resource="&lcc-lr;LivingLanguage"/>
      <rdfs:label>Shikomor</rdfs:label>
      <skos:definition rdf:datatype="&xsd;string">Shikomor language</skos:definition>
      <lcc-lr:hasEnglishName rdf:datatype="&xsd;string">Shikomor</lcc-lr:hasEnglishName>
      <rdfs:comment>Not yet allocated a code in ISO 639</rdfs:comment>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>
    <owl:NamedIndividual rdf:about="&amp;lcc-3166-1;L002">
      <rdf:type rdf:resource="&lcc-lr;IndividualLanguageIdentifier"/>
      <rdfs:label>002</rdfs:label>
      <skos:definition rdf:datatype="&xsd;string">Alpha-3 language code for Shikomor</skos:definition>
      <lcc-lr:hasTag rdf:datatype="&xsd;string">002</lcc-lr:hasTag>
      <lcc-lr:denotes rdf:resource="&amp;lcc-3166-1;Shikomor"/>
      <lcc-lr:identifies rdf:resource="&amp;lcc-3166-1;Shikomor"/>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>
  
    <xsl:value-of select="'&#x0A;&#x0A;'"/>
   <owl:NamedIndividual rdf:about="&amp;lcc-3166-1;SeselwaCreoleFrench">
      <rdf:type rdf:resource="&lcc-lr;IndividualLanguage"/>
      <rdf:type rdf:resource="&lcc-lr;LivingLanguage"/>
      <rdfs:label>Seselwa Creole French</rdfs:label>
      <skos:definition rdf:datatype="&xsd;string">Seselwa Creole French language</skos:definition>
      <lcc-lr:hasEnglishName rdf:datatype="&xsd;string">Seselwa Creole French</lcc-lr:hasEnglishName>
      <lcc-lr:hasIndigenousName rdf:datatype="&xsd;string">kreol</lcc-lr:hasIndigenousName>
      <rdfs:comment>Part of ISO 639-3, not otherwise represented in OMG ontologies</rdfs:comment>
     <rdfs:isDefinedBy>
       <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
     </rdfs:isDefinedBy>
   </owl:NamedIndividual>
   <owl:NamedIndividual rdf:about="&amp;lcc-3166-1;crs">
      <rdf:type rdf:resource="&lcc-lr;IndividualLanguageIdentifier"/>
      <rdfs:label>crs</rdfs:label>
      <skos:definition rdf:datatype="&xsd;string">Alpha-3 language code for Seselwa Creole French </skos:definition>
      <lcc-lr:hasTag rdf:datatype="&xsd;string">crs</lcc-lr:hasTag>
      <lcc-lr:denotes rdf:resource="&amp;lcc-3166-1;SeselwaCreoleFrench"/>
      <lcc-lr:identifies rdf:resource="&amp;lcc-3166-1;SeselwaCreoleFrench"/>
      <rdfs:isDefinedBy>
        <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
      </rdfs:isDefinedBy>
    </owl:NamedIndividual>
  
   <!-- Main processing -->
   <xsl:apply-templates select="country-codes/country"/>
  </rdf:RDF>
</xsl:template>

  <xsl:template match="country[not(contains(status, 'reserved')) and not(contains(status, 'formerly'))]">
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
  <xsl:variable name="country-uri" select="concat($countries-base-uri, $countryCamel)"/> 
  <!-- Output -->
  <xsl:call-template name="comment-block">
    <xsl:with-param name="the-text"  select="$country-name"/>
  </xsl:call-template> 
  <owl:NamedIndividual>
    <xsl:attribute name="rdf:about" select="$country-uri"/>
    <rdf:type>
      <xsl:attribute name="rdf:resource" select="'&amp;lcc-cr;Country'"/>
    </rdf:type>
    <rdfs:label>
      <xsl:value-of select="$country-name"/>
    </rdfs:label>
    <skos:definition>
      <xsl:value-of select="concat('individual representing the country of ', $country-name )"/>
    </skos:definition>
    <lcc-cr:isIndependent rdf:datatype="&amp;xsd;boolean">
      <xsl:choose>
        <xsl:when test="upper-case(independent)='YES'">true</xsl:when>
        <xsl:otherwise>false</xsl:otherwise>
      </xsl:choose>
    </lcc-cr:isIndependent>
    <lcc-cr:hasNumericRegionCode rdf:datatype="&amp;xsd;string">
      <xsl:value-of select="numeric-code"/>
    </lcc-cr:hasNumericRegionCode>
    <xsl:call-template name="doLabels"/>
    <xsl:for-each select="language">
      <xsl:if test="upper-case(language-is-administrative) = 'YES'">
        <xsl:variable name="lang-uri">
          <xsl:call-template name="lookup-lang-uri">
            <xsl:with-param name="code3" select="language-alpha-3-code"/>
          </xsl:call-template>
        </xsl:variable>
        <lcc-cr:usesAdministrativeLanguage>
          <xsl:attribute name="rdf:resource" select="$lang-uri"/>
        </lcc-cr:usesAdministrativeLanguage>       
      </xsl:if>    
    </xsl:for-each>
    <xsl:if test="remark-part-1[@lang3code='eng']">
       <lcc-cr:hasRemarks>
         <xsl:value-of select="remark-part-1[@lang3code='eng']"/>
       </lcc-cr:hasRemarks>
    </xsl:if>
    <xsl:if test="remark-part-2[@lang3code='eng']">
      <lcc-cr:hasRemarks>
        <xsl:value-of select="remark-part-2[@lang3code='eng']"/>
      </lcc-cr:hasRemarks>
    </xsl:if>
    <lcc-cr:isClassifiedBy rdf:resource="&amp;lcc-3166-1;Country"/>     
    <rdfs:isDefinedBy>
      <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
    </rdfs:isDefinedBy>
  </owl:NamedIndividual>

  <!-- Now the codes -->
  <xsl:value-of select="'&#x0A;&#x0A;'"/>       
  <owl:NamedIndividual>
    <xsl:attribute name="rdf:about" select="concat($countries-base-uri, alpha-2-code)"/>
    <rdf:type rdf:resource="&amp;lcc-cr;Alpha2Code"/>
    <skos:definition>
      <xsl:value-of select="concat('Alpha-2 country code for ', $country-name)"/>
    </skos:definition>
    <rdfs:label>
      <xsl:value-of select="alpha-2-code"/>
    </rdfs:label>
    <lcc-lr:hasTag rdf:datatype="&amp;xsd;string">
      <xsl:value-of select="alpha-2-code"/>
    </lcc-lr:hasTag>
    <lcc-lr:denotes>
      <xsl:attribute name="rdf:resource" select="$country-uri"/>                
    </lcc-lr:denotes>
    <lcc-lr:identifies>
      <xsl:attribute name="rdf:resource" select="$country-uri"/>                           
    </lcc-lr:identifies>
    <lcc-lr:isMemberOf rdf:resource="&amp;lcc-3166-1;ISO3166-1-Alpha2-CodeSet"/>         
    <rdfs:isDefinedBy>
      <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
    </rdfs:isDefinedBy>
  </owl:NamedIndividual>
  <xsl:value-of select="'&#x0A;&#x0A;'"/>

  <owl:NamedIndividual>
    <xsl:attribute name="rdf:about" select="concat($countries-base-uri, alpha-3-code)"/>
    <rdf:type rdf:resource="&amp;lcc-cr;Alpha3Code"/>
    <skos:definition>
      <xsl:value-of select="concat('Alpha-3 country code for ', $country-name)"/>
    </skos:definition>
    <rdfs:label>
      <xsl:value-of select="alpha-3-code"/>
    </rdfs:label>
    <lcc-lr:hasTag rdf:datatype="&amp;xsd;string">
      <xsl:value-of select="alpha-3-code"/>
    </lcc-lr:hasTag>
    <lcc-lr:denotes>
      <xsl:attribute name="rdf:resource" select="$country-uri"/>                
    </lcc-lr:denotes>
    <lcc-lr:identifies>
      <xsl:attribute name="rdf:resource" select="$country-uri"/>                           
    </lcc-lr:identifies>
    <lcc-lr:isMemberOf rdf:resource="&amp;lcc-3166-1;ISO3166-1-Alpha3-CodeSet"/>         
    <rdfs:isDefinedBy>
      <xsl:attribute name="rdf:resource" select="$countries-base-uri"/>
    </rdfs:isDefinedBy>
  </owl:NamedIndividual>
</xsl:template>

<xsl:template match="*" priority="-1"/>

</xsl:stylesheet>