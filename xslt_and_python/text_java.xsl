<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:eld="http://eldritch.code.newtfire.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="3.0">
  
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    <xsl:variable name="list" select="document('fullList_syn.xml')"/>
    <xsl:template match="/">
        <html>
            <head class="head"> 
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <link rel="stylesheet" type="text/css" href="LC_Code2_5.css" />
                <script type="text/javascript" src="textHover.js">/**/</script>
            </head>
            <body>
                <div id="header">                                    
                    <xsl:comment>AZ: Nav bar</xsl:comment>
                    <div id="master_bar">
                        <a href="index.html">Home</a>
                        <a href="about.html">About</a>
                        <a href="texts.html">Texts</a>
                        <a href="Analysis.html">Analysis</a>
                        <a href="ambiguity_table.html">Ambiguity Table</a>
                        <a  class="right" rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">
                            <img alt="Creative Commons License" style="border-width:0"
                                src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png"/>
                        </a>
                    </div>
                </div>
                <div id="text">
                    <p><xsl:apply-templates select="//epigraph"/></p>
                    <xsl:apply-templates select="//text"/>
                </div>
            </body>
        </html>
    </xsl:template>
<xsl:template match="p">
    <p><xsl:apply-templates/></p>
</xsl:template>
    <xsl:template match="head">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    <xsl:template match="w">
        <span title="{@type}" class="anchor" ><xsl:apply-templates/></span>
        <span class="note">
            <xsl:if test="@synsetCount > 0">Definition: <xsl:value-of select="$list//eld:word[eld:w = lower-case(current()/normalize-space())]/string-join(descendant::eld:wnDef, '; ')"/></xsl:if>
            <br/>
            Word Type: <xsl:value-of select="@type"/>
            <br/>
            Number Of Synsets: <xsl:value-of select="@synsetCount"/>
        </span>
    </xsl:template>
</xsl:stylesheet>