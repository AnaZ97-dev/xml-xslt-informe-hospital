<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="hospital/datos/nombre"/>
                </title>
                <style>
                    table { border-collapse: collapse; width: 90%; }
                    th, td { border: 1px solid black; padding: 6px; text-align: center; }
                </style>
            </head>
            <body>

                <h1>Autor/a: Ana Zafra Vallejo</h1>

                <h2>1.- Pacientes mayores de 50 años (ordenados por edad)</h2>
        
                <xsl:for-each select="hospital/pacientes/paciente[edad > 50]">
                    <xsl:sort select="edad" data-type="number" order="descending"/>
                    <p>
                        <xsl:value-of select="position()"/>.- <xsl:value-of select="nombre"/>. [<xsl:value-of select="edad"/> años]
                    </p>
                </xsl:for-each>

                <h2>2.- Precio medio de antibióticos y antivirales</h2>

                <xsl:variable name="meds" select="hospital/medicamentos/medicamento[@tipo='Antibiótico' or @tipo='Antiviral']" />
                <p>
                    Precio medio: 
                    <xsl:value-of select="format-number(sum($meds/precio) div count($meds), '#.00')"/> €
                </p>       


                <h2>3.- Stock de medicamentos (ordenados por stock)</h2>
        
                <table>
                    <tr>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Precio</th>
                        <th>Stock</th>
                    </tr>
                    <xsl:for-each select="hospital/medicamentos/medicamento">
                        <xsl:sort select="stock" data-type="number" order="ascending"/>
                        <tr>
                            <xsl:attribute name="style">
                                <xsl:choose>
                                    <xsl:when test="stock = 0">background-color: red;</xsl:when>
                                    <xsl:when test="stock &lt; 20">background-color: orange;</xsl:when>
                                    <xsl:otherwise>background-color: green;</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <td>
                                <xsl:value-of select="nombre"/>
                            </td>
                            <td>
                                <xsl:value-of select="@tipo"/>
                            </td>
                            <td>
                                <xsl:value-of select="precio"/> €</td>
                            <td>
                                <xsl:value-of select="stock"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h2>4.- Pacientes y medicación</h2>
                
                <xsl:for-each select="hospital/pacientes/paciente">
                    <xsl:variable name="idP" select="@id"/>
                    <p>
                        <strong>
                            <xsl:value-of select="nombre"/>
                        </strong>
                    </p>
                    <table>
                        <tr>
                            <th style="width: 50%;">Medicamento</th>
                            <th style="width: 50%;">Dosis</th>
                        </tr>
                        <xsl:choose>
                            <xsl:when test="../../medicaciones/medicacion[@idPaciente=$idP]">
                                <xsl:for-each select="../../medicaciones/medicacion[@idPaciente=$idP]">
                                    <xsl:variable name="idM" select="@idMedicamento"/>
                                    <tr>
                                        <td>
                                            <xsl:value-of select="../../medicamentos/medicamento[@id=$idM]/nombre"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="."/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <td colspan="2">No toma ningún medicamento</td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </table>
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
