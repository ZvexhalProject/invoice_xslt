<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="Cover" page-height="29.7cm" page-width="21.0cm" margin-top="1cm"
                    margin-left="2cm" margin-right="2cm" margin-bottom="1cm">
                    <fo:region-body />
                    <fo:region-start region-name="xsl-region-start" extent="1cm" display-align="center"
                        background-color="#0068b4" />
                </fo:simple-page-master>

                <fo:simple-page-master master-name="Content" page-height="29.7cm" page-width="21.0cm" margin-top="2cm"
                    margin-left="2cm" margin-right="2cm" margin-bottom="1cm">
                    <fo:region-body />
                    <fo:region-start region-name="xsl-region-start" extent="1cm" display-align="center"
                        background-color="#0068b4" />
                </fo:simple-page-master>

                <fo:simple-page-master master-name="Invoice" page-height="29.7cm" page-width="21.0cm" margin-top="1cm"
                    margin-left="2cm" margin-right="2cm" margin-bottom="1cm">
                    <fo:region-body region-name="xsl-region-body" margin-top="7.5cm" margin-bottom="2cm"/>
                    <fo:region-before region-name="xsl-region-before" extent="6.5cm"/>
                    <fo:region-after region-name="xsl-region-after" extent="1cm" />
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="Cover">
                <fo:static-content flow-name="xsl-region-start">
                    <fo:block />
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body" margin-left="1cm">
                    <fo:block-container space-before="5cm" height="5cm" display-align="center">
                        <fo:block>
                            <fo:external-graphic src="../graphics/HSA_Logo.png" width="100%" content-height="100%"
                                content-width="scale-to-fit" scaling="uniform" />
                        </fo:block>
                    </fo:block-container>
                    <fo:block-container height="15cm" display-align="center">
                        <fo:block space-before="2cm" font-size="xx-large" text-align="start">
                            Beispielkatalog: Rechnungserstellung vom
                        </fo:block>
                        <fo:block space-before="6cm" font-size="small" text-align="start">
                            Ein Projekt von Muchtar Arefi im Modul Cross-Media-Publishing
                        </fo:block>
                        <fo:block space-before="5mm" font-size="small" text-align="start">
                            Bei Prof. Dr. Bantel
                        </fo:block>
                        <fo:block space-before="5mm" font-size="small" text-align="start">
                            Sommersemester 2021
                        </fo:block>
                    </fo:block-container>
                </fo:flow>
            </fo:page-sequence>

            <fo:page-sequence master-reference="Content">
                <fo:static-content flow-name="xsl-region-start" margin-left="1cm">
                    <fo:block />
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block break-before='page' margin-top="2cm" margin-left="2cm">
                        <fo:block space-after="2cm" font-size="16pt" font-weight="bold">Inhaltsverzeichnis</fo:block>
                        <xsl:for-each select="//Rechnung">
                            <fo:block space-after="1mm" text-align-last="justify">
                                <fo:basic-link internal-destination="{generate-id(.)}">
                                    <xsl:text>Rechnungsnummer: </xsl:text>
                                    <xsl:value-of select="Rechnungsnummer" />
                                    <fo:leader leader-pattern="dots" />
                                    <fo:page-number-citation ref-id="{generate-id(.)}" />
                                </fo:basic-link>
                            </fo:block>
                        </xsl:for-each>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>


            <xsl:for-each select="//Rechnung">
              <fo:page-sequence master-reference="Invoice" id="{generate-id(.)}">
                    <fo:static-content flow-name="xsl-region-before">
                        <fo:block>
                            <fo:table>
                                <fo:table-column column-width="8.5cm" />
                                <fo:table-column column-width="8.5cm" />
                                <fo:table-body>
                                    <fo:table-row font-size="18pt" line-height="30px" background-color="#3e73b9"
                                        color="white">
                                        <fo:table-cell padding-left="5mm">
                                            <fo:block>
                                                <fo:external-graphic src="../graphics/HSA_Logo.png" width="100%"
                                                    content-height="100%" content-width="scale-to-fit"
                                                    scaling="uniform" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding-right="5mm">
                                            <fo:block text-align="right" margin-top="5mm">
                                                RECHNUNG
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row margin-top="2cm">
                                        <fo:table-cell padding-left="1cm" padding-top="2cm">
                                            <fo:block>
                                                <fo:block>
                                                    <xsl:value-of select="Kundenvorname" />&#160;
                                                    <xsl:value-of select="Kundennachname" />
                                                </fo:block>
                                                <fo:block>
                                                    <xsl:value-of select="Kundenstrasse" />&#160;
                                                    <xsl:value-of select="Kundenstrassennummer" />
                                                </fo:block>
                                                <fo:block>
                                                    <xsl:value-of select="Kundenstrassenort" />
                                                </fo:block>
                                                <fo:block>
                                                    <xsl:value-of select="Kundenland" />
                                                </fo:block>


                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding-left="1cm" padding-top="1cm" padding-right="3mm">
                                            <fo:block text-align="right">
                                                <fo:block>
                                                    <xsl:value-of select="Unternehmensname" />
                                                </fo:block>
                                                <fo:block>
                                                    <xsl:value-of select="Unternehmensadresse" />&#160;
                                                    <xsl:value-of select="Unternehmensadressennummer" />
                                                </fo:block>
                                                <fo:block>
                                                    <xsl:value-of select="Unternehmensort" />
                                                </fo:block>
                                                <fo:block>
                                                    <xsl:value-of select="Unternehmensland" />
                                                </fo:block>
                                                <fo:block margin-top="3mm" font-weight="bold">Rechnungsnummer:
                                                    <xsl:value-of select="Rechnungsnummer" />
                                                </fo:block>
                                                <fo:block font-weight="bold">Kundennummer:
                                                    <xsl:value-of select="Kundennummer" />
                                                </fo:block>
                                                <fo:block font-weight="bold">Datum:
                                                    <xsl:value-of select="Kaufdatum" />
                                                </fo:block>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-body>
                            </fo:table>
                        </fo:block>
                    </fo:static-content>

                    <fo:static-content flow-name="xsl-region-after">
                        <fo:block text-align="center">
                            <fo:page-number />
                        </fo:block>
                    </fo:static-content>

                    <fo:flow flow-name="xsl-region-body">
                        <fo:block width="17cm" text-align="left">
                        Der Rechnung zugehörende Artikel: 
                        </fo:block>
                        <fo:block margin-top="5mm" width="17cm" text-align="center">
                            <fo:table>
                                <fo:table-column column-width="2cm" />
                                <fo:table-column column-width="4cm" />
                                <fo:table-column column-width="6cm" />
                                <fo:table-column column-width="1.5cm" />
                                <fo:table-column column-width="3.5cm" />
                                <fo:table-header>
                                    <fo:table-row line-height="1cm" background-color="#f5f5f5" text-align="center"
                                        font-weight="bold">
                                        <fo:table-cell border="1px solid #cce1f0">
                                            <fo:block>Menge</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="1px solid #cce1f0">
                                            <fo:block>Artikelnummer</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="1px solid #cce1f0">
                                            <fo:block>Artikelname</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="1px solid #cce1f0">
                                            <fo:block>Preis</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="1px solid #cce1f0">
                                            <fo:block>Gesamtpreis</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>

                                </fo:table-header>

                                <fo:table-body>
                                    <xsl:for-each select="./Produkte/Produkt">
                                        <fo:table-row keep-together.within-page="always" line-height="8mm">
                                            <fo:table-cell border="1px solid #cce1f0" text-align="center">
                                                <fo:block>
                                                    <xsl:value-of select="Menge" />
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border="1px solid #cce1f0" padding-left="3mm">
                                                <fo:block>
                                                    <xsl:value-of select="Artikelnummer" />
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border="1px solid #cce1f0" text-align="center"
                                                padding-right="3mm">
                                                <fo:block>
                                                    <xsl:value-of select="Artikelname" />
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border="1px solid #cce1f0" text-align="center"
                                                padding-right="3mm">
                                                <fo:block>
                                                    <xsl:value-of select="Preis" />€
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell border="1px solid #cce1f0" text-align="right"
                                                padding-right="3mm">
                                                <fo:block>
                                                    <xsl:value-of select="Gesamtpreis" />€
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </xsl:for-each>
                                    <fo:table-row>
                                    <fo:table-cell padding-top="1cm">
                                                <fo:block> </fo:block>
                                            </fo:table-cell>
                                    </fo:table-row>
                                        <fo:table-row  font-weight="bold" line-height="1cm">
                                            <fo:table-cell number-columns-spanned="4" text-align="right"
                                                padding-right="3mm">
                                                <fo:block>Summe</fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell text-align="right" padding-right="3mm"
                                                border="1px solid #cce1f0">
                                                <fo:block>
                                                 <xsl:value-of select="Summe"/>€
                                                 </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                </fo:table-body>
                            </fo:table>
                        </fo:block>
                    </fo:flow>
                </fo:page-sequence>
            </xsl:for-each>






        </fo:root>
    </xsl:template>
</xsl:stylesheet>