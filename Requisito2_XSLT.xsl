<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <empresas>
        <xsl:attribute name="grupo"> <xsl:value-of select="ite/empresa"/>  </xsl:attribute>
            <ite > 
            <xsl:attribute name="telefono"> <xsl:value-of select="ite/telefono"/>  </xsl:attribute>
            <xsl:attribute name="web"> <xsl:value-of select="ite/@web"/>  </xsl:attribute>
                <nombre><xsl:value-of select="ite/@nombre"/></nombre>
                <directiva>
                    <nombre>
                        <xsl:attribute name="rol"> director</xsl:attribute>
                        <xsl:attribute name="despacho"> <xsl:value-of select="ite/director/despacho"/>  </xsl:attribute>
                        <xsl:value-of select="ite/director/nombre"/>
                    </nombre>
                    <nombre>
                        <xsl:attribute name="rol"> Jefe de Estudios</xsl:attribute>
                        <xsl:attribute name="despacho"> <xsl:value-of select="ite/jefe_estudios/despacho"/>  </xsl:attribute>
                        <xsl:value-of select="ite/jefe_estudios/nombre"/>
                    </nombre>
                </directiva>
                
                <formacion>
                <xsl:for-each select="ite/ciclos/ciclo">
                    <nombre >
                        <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute> 
                        <xsl:attribute name="grado"><xsl:value-of select="grado"/></xsl:attribute>
                        <xsl:attribute name="año_decreto"> <xsl:value-of select="decretoTitulo/@año"/></xsl:attribute>
                        <xsl:value-of select="nombre"/>
                    </nombre>
                </xsl:for-each>
                </formacion>
                <profesores>
                <xsl:for-each select="ite/profesores/profesor">    
                    <nombre >
                        <xsl:attribute name="id"><xsl:value-of select="id"/></xsl:attribute> 
                        <xsl:value-of select="nombre"/>
                    </nombre>
                </xsl:for-each>    
                </profesores>
            </ite>
        </empresas>
</xsl:template>
</xsl:stylesheet>    