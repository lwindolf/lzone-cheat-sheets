## Drop all empty nodes

Use this copy template

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>     

together with this stripping template:

    <xsl:template match="*[. = '']"/>

or a more exact one to account for attributes

    <xsl:template match="*[not(@*) and not(*) and (not(text())]"/>
    
See also: [Stackoverflow](https://stackoverflow.com/questions/4404491/xslt-to-remove-empty-nodes-and-nodes-with-1)
