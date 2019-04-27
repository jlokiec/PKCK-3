<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xhtml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>
    
    <xsl:template name="musicLibraryReport" match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
            <head>
                <title>CD Collection</title>
            </head>
            <body>
                <h2>My CD Collection</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Title</th>
                        <th>premiereDate</th>
                        <th>cdMusician</th>
                        <th>cdGenre</th>
                        <th>cdLanguage</th>
                        <th>numberOfCds</th>
                        <th>price</th>
                    </tr>
                    <xsl:for-each select="musicLibraryReport/cd">
                        <tr>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                            <td>
                                <xsl:value-of select="premiereDate"/>
                            </td>
                            <td>
                                <xsl:value-of select="cdMusician"/>
                            </td>
                            <td>
                                <xsl:value-of select="cdGenre"/>
                            </td>
                            <td>
                                <xsl:value-of select="cdLanguage"/>
                            </td>
                            <td>
                                <xsl:value-of select="numberOfCds"/>
                            </td>
                            <td>
                                <xsl:value-of select="price"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>