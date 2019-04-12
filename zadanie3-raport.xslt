<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:element name="musicLibraryReport">
            <xsl:element name="summary">
                <xsl:element name="songsCount">
                    <xsl:value-of select="count(document/catalog/cd)"/>
                </xsl:element>
                <xsl:element name="rockSongsCount">
                    <xsl:value-of select="count(document/catalog/cd/cdGenre[@genreId = 'SROCK']) + count(document/catalog/cd/cdGenre[@genreId = 'ROCK']) + count(document/catalog/cd/cdGenre[@genreId = 'AROCK']) + count(document/catalog/cd/cdGenre[@genreId = 'PROCK']) + count(document/catalog/cd/cdGenre[@genreId = 'HROCK'])"/>
                </xsl:element>
                <xsl:element name="popSongsCount">
                    <xsl:value-of select="count(document/catalog/cd/cdGenre[@genreId = 'POP'])"/>
                </xsl:element>
                <xsl:element name="otherSongsCount">
                    <xsl:value-of select="count(document/catalog/cd/cdGenre[@genreId = 'DPOLO']) + count(document/catalog/cd/cdGenre[@genreId = 'RAP']) + count(document/catalog/cd/cdGenre[@genreId = 'REG']) "/>
                </xsl:element>
                <xsl:element name="polishSongsCount">
                    <xsl:value-of select="count(document/catalog/cd/cdLanguage[@languageId = 'polski'])" />
                </xsl:element>
                <xsl:element name="mostPrice">
                    <xsl:value-of select="max(document/catalog/cd/price)" />
                </xsl:element>
            </xsl:element>
            <xsl:element name="authorsDocument">
                <xsl:for-each select="document/header/authors/author">
                    <xsl:element name="author">	
                        <xsl:value-of select="concat(name, ' ', surname)"/>   
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>

                <xsl:element name="book">
                    <xsl:apply-templates select="document/musicians" />
                </xsl:element>

            <xsl:element name="listSongs">
                <xsl:for-each select = "document/catalog/cd">
                    <xsl:element name = "album">
                        <xsl:element name = "title">
                            <xsl:value-of select = "title"/>
                        </xsl:element>
                            <!-- <xsl:element name = "musician">
                                <xsl:variable name="musicianId" select="." />
                                <xsl:value-of select="cdMusician[@musicianId = $musicianId]" />
                            </xsl:element> -->
                        <xsl:variable name="musicianId" select="@musicianId" />
                        <!-- <xsl:choose >
                            <xsl:when test="string(@genreId) = 'ROCK'">
                                <xsl:attribute name="cdGenre">ROCK</xsl:attribute>
                            </xsl:when>			
                        </xsl:choose> -->
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>