<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template name="MusicStore" match="/document">
        <xsl:element name="musicLibraryReport">
            <xsl:call-template name="Raport" />
            <xsl:apply-templates select="catalog"/>
        </xsl:element>
    </xsl:template>
    <!-- Statistics -->
    <xsl:template name="Raport">
        <xsl:element name="statistic">
            <xsl:element name="summary">
                <xsl:element name="albumCount">
                    <xsl:value-of select="count(catalog/cd)"/>
                </xsl:element>

                <xsl:variable name="rockCount" select="count(catalog/cd/cdGenre[@genreId = 'ROCK'])" />
                <xsl:variable name="softRockCount" select="count(catalog/cd/cdGenre[@genreId = 'SROCK'])" />
                <xsl:variable name="altRockCount" select="count(catalog/cd/cdGenre[@genreId = 'AROCK'])" />
                <xsl:variable name="progressiveRockCount" select="count(catalog/cd/cdGenre[@genreId = 'PROCK'])" />
                <xsl:variable name="hardRockCount" select="count(catalog/cd/cdGenre[@genreId = 'HROCK'])" />

                <xsl:element name="rockAlbumCount">
                    <xsl:value-of select="$rockCount + $softRockCount + $altRockCount + $progressiveRockCount + $hardRockCount"/>
                </xsl:element>
                <xsl:element name="popAlbumCount">
                    <xsl:value-of select="count(catalog/cd/cdGenre[@genreId = 'POP'])"/>
                </xsl:element>

                <xsl:variable name="discoPoloCount" select="count(catalog/cd/cdGenre[@genreId = 'DPOLO'])" />
                <xsl:variable name="rapCount" select="count(catalog/cd/cdGenre[@genreId = 'RAP'])" />
                <xsl:variable name="reggaeCount" select="count(catalog/cd/cdGenre[@genreId = 'REG'])" />

                <xsl:element name="otherAlbumCount">
                    <xsl:value-of select="$discoPoloCount + $rapCount + $reggaeCount"/>
                </xsl:element>
                <xsl:element name="polishAlbumCount">
                    <xsl:value-of select="count(catalog/cd/cdLanguage[@languageId = 'polski'])" />
                </xsl:element>
                <xsl:element name="highestPrice">
                    <xsl:variable name="varHighestPrice" select="max(catalog/cd/price)" />
                    <xsl:value-of select="concat($varHighestPrice, ' ', catalog/cd[price=$varHighestPrice]/price/@currency)" />
                </xsl:element>
                <xsl:element name="lowestPrice">
                    <xsl:variable name="varLowestPrice" select="min(catalog/cd/price)" />
                    <xsl:value-of select="concat($varLowestPrice, ' ', catalog/cd[price=$varLowestPrice]/price/@currency)" />
                </xsl:element>
                <xsl:element name="reportDate">
                    <xsl:value-of select="format-dateTime(current-dateTime(), '[D01].[M01].[Y0001] [H01]:[m01]')" />
                </xsl:element>
            </xsl:element>
            <xsl:element name="authorsDocument">
                <xsl:for-each select="header/authors/author">
                    <xsl:element name="author">
                        <xsl:value-of select="concat(name, ' ', surname, ' ', studentId)"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <!-- CDs -->
    <xsl:template name="Catalog" match="catalog">
        <xsl:apply-templates select="cd">
            <xsl:sort select="title" />
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template name="CDs" match="cd">
        <xsl:element name="cd">
            <xsl:apply-templates select="title"/>
            <xsl:apply-templates select="cdMusician/@musicianId" />
            <xsl:apply-templates select="cdLanguage/@languageId" />
            <xsl:apply-templates select="cdDistributor/@distributorId" />
            <xsl:apply-templates select="premiereDate"/>
            <xsl:apply-templates select="numberOfCds"/>
            <xsl:apply-templates select="cdGenre/@genreId"/>
            <xsl:apply-templates select="price"/>
        </xsl:element>
    </xsl:template>
    <xsl:template name="Title" match="title">
        <xsl:element name="title">
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>
    <xsl:template name="cdMusician" match="cdMusician/@musicianId">
        <xsl:element name="cdMusician">
            <xsl:variable name="musicianId" select="." />
            <xsl:value-of select="concat(/document/musicians/musician[@musicianId = $musicianId]/name, ' ', /document/musicians/musician[@musicianId = $musicianId]/surname)" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="cdLanguage" match="cdLanguage/@languageId">
        <xsl:element name="cdLanguage">
            <xsl:variable name="languageId" select="." />
            <xsl:value-of select="/document/languages/language[@languageId = $languageId]" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="cdDistributor" match="cdDistributor/@distributorId">
        <xsl:element name="cdDistributor">
            <xsl:variable name="distributorId" select="." />
            <xsl:value-of select="/document/distributors/distributor[@distributorId = $distributorId]" />
        </xsl:element>
    </xsl:template>
    <xsl:template name="premiereDate" match="premiereDate">
        <xsl:element name="premiereDate">
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>
    <xsl:template name="numberOfCds" match="numberOfCds">
        <xsl:element name="numberOfCds">
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>
      <xsl:template name="cdGenre" match="cdGenre/@genreId">
        <xsl:element name="cdGenre">
            <xsl:variable name="genreId" select="." />
            <xsl:value-of select="/document/genres/genre[@genreId = $genreId]/@genreName" />
        </xsl:element>
    </xsl:template>
       <xsl:template name="price" match="price">
        <xsl:element name="price">
            <xsl:value-of select="concat(. , ' ', ./@currency)" />
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>