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

        <h1>Autor/a: <!-- AÑADIR AQUÍ TU NOMBRE Y APELLIDOS --></h1>


        <h2>1.- Pacientes mayores de 50 años (ordenados por edad)</h2>
        
 <!-- AÑADIR AQUÍ EL CÓDIGO DEL EJERCICIO -->


        <h2>2.- Precio medio de antibióticos y antivirales</h2>

 <!-- AÑADIR AQUÍ EL CÓDIGO DEL EJERCICIO -->


        <h2>3.- Stock de medicamentos (ordenados por stock)</h2>

 <!-- AÑADIR AQUÍ EL CÓDIGO DEL EJERCICIO -->


        <h2>4.- Pacientes y medicación</h2>

 <!-- AÑADIR AQUÍ EL CÓDIGO DEL EJERCICIO -->

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
