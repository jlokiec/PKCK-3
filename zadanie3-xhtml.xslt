<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>
    
    <xsl:template name="musicLibraryReport" match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
            <head>
                <title>Katalog płyt CD</title>
            </head>
            <body>
                <h2>Katalog płyt CD</h2>
                <h3>Autorzy</h3>
                    <xsl:for-each select="musicLibraryReport/statistic/authorsDocument/author">
                        <p><xsl:value-of select="." /></p>
                    </xsl:for-each>
                <h4>Lista płyt</h4>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Tytuł</th>
                        <th>Data premiery</th>
                        <th>Wykonawca</th>
                        <th>Gatunek</th>
                        <th>Język</th>
                        <th>Liczba płyt</th>
                        <th>Cena</th>
                    </tr>
                    <xsl:for-each select="musicLibraryReport/cd">
                        <tr>
                            <td>
                                <xsl:value-of select="title" disable-output-escaping="yes"/>
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
                <h4>Statystyki</h4>
                <p>Liczba albumów: <xsl:value-of select="musicLibraryReport/statistic/summary/albumCount"/></p>
                <p>Albumy rockowe: <xsl:value-of select="musicLibraryReport/statistic/summary/rockAlbumCount"/></p>
                <p>Albumy pop: <xsl:value-of select="musicLibraryReport/statistic/summary/popAlbumCount"/></p>
                <p>Inne albumy: <xsl:value-of select="musicLibraryReport/statistic/summary/otherAlbumCount"/></p>
                <p>Albumy polskie: <xsl:value-of select="musicLibraryReport/statistic/summary/polishAlbumCount"/></p>
                <p>Najdroższy album kosztował: <xsl:value-of select="musicLibraryReport/statistic/summary/highestPrice"/></p>
                <p>Najtańszy album kosztował: <xsl:value-of select="musicLibraryReport/statistic/summary/lowestPrice"/></p>
                <p>Data wygenerowania raportu: <xsl:value-of select="musicLibraryReport/statistic/summary/reportDate"/></p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>