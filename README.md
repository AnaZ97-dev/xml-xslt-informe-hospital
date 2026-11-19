Transformación XML a HTML con XSLT (Informe Hospitalario)
Proyecto de procesamiento de datos en XML utilizando hojas de estilo XSLT para generar un informe HTML dinámico. El proyecto aplica lógica de programación (bucles, condicionales y ordenación) para transformar los datos de un hospital.

Tecnologías y Herramientas
Datos: XML (eXtensible Markup Language)
Transformación: XSLT 1.0 (eXtensible Stylesheet Language Transformations)
Lenguaje de salida: HTML5
Editor: Apache NetBeans

Funcionalidades y Conceptos Aplicados
El archivo informe_hospital_alumno.xsl contiene la lógica para generar 4 secciones en el informe HTML:
Filtrado y ordenación de pacientes: Uso de <xsl:for-each> con condiciones ([edad > 50]) y <xsl:sort> para mostrar a los pacientes mayores de 50 años de mayor a menor edad.
Cálculo de precios: Uso de variables (<xsl:variable>) para seleccionar antibióticos y antivirales, y calcular el precio medio con sum() y count().
Tabla de stock con colores dinámicos: Creación de una tabla que ordena los medicamentos por stock. Uso de <xsl:choose> y <xsl:when> para cambiar el color de fondo de la fila según el stock (rojo para 0, naranja para menos de 20, verde para el resto).
Relación de pacientes y medicación: Uso de bucles anidados y condicionales para cruzar los datos de pacientes y medicamentos a través de los IDs. Uso de <xsl:choose> para mostrar un mensaje si el paciente no toma nada.

Cómo generar el informe
Abre el proyecto en Apache NetBeans.
Haz clic derecho sobre el archivo informe_hospital_alumno.xsl y selecciona "XSL Transformation...".
Selecciona el archivo datos_hospital.xml como fuente de datos.
Elige la opción de sobrescribir el archivo resultado.html y haz clic en "OK".
Abre el archivo resultado.html en tu navegador para ver el informe generado.
