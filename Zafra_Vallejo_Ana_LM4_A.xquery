(: Ejercicio 1 :)
(: Obtener apellidos, nombre, edad y provincia de los pacientes mayores de 22 años y que no sean de Málaga, ordenados alfabéticamente (A-Z) por apellidos y nombre. 
FORMATO:
<paciente>
  <apellidos>Fernández</apellidos>
  <nombre>Carlos</nombre>
  <edad>30</edad>
  <provincia>Sevilla</provincia>
</paciente>
<paciente>
  ...
</paciente>
...
:)

for $p in doc("hospital.xml")//paciente
where $p/edad > 22 and $p/provincia != 'Málaga'
order by $p/apellidos ascending, $p/nombre ascending
return
<paciente>
  {$p/apellidos}
  {$p/nombre}
  {$p/edad}
  {$p/provincia}
</paciente>
,

(: Ejercicio 2 :)
(: Obtener el nombre de las especialidades, así como el nombre y los apellidos del facultativo que pase esa consulta, cuando el sueldo del facultativo sea menor o igual a 3500€. 
FORMATO:
<especialidad>
  <nombre>Traumatología</nombre>
  <facultativo>Antonio Amate</facultativo>
</especialidad>
<especialidad>
  ...
</especialidad>
...
:)

for $e in doc("hospital.xml")//especialidad
for $f in doc("hospital.xml")//facultativo
where $e/@facultativo = $f/@dni and $f/sueldo <= 3500
return
<especialidad>
  {$e/nombre}
  <facultativo>{concat($f/nombre, ' ', $f/apellidos)}</facultativo>
</especialidad>
,

(: Ejercicio 3 :)
(: Obtener los pacientes de las provincias de Sevilla y Málaga: la media de su edad, la edad mayor, la suma del límite de todas sus pólizas, así como la menor. 
FORMATO:
<SevillaMalaga>
  <media_edad>XX</media_edad>
  <mayor_edad>XX</mayor_edad>
  <suma_limitePolizas>XX</suma_limitePolizas>
  <menor_limitePoliza>XX</menor_limitePoliza>
</SevillaMalaga>
:)

let $pacientes := doc("hospital.xml")//paciente[provincia = 'Sevilla' or provincia = 'Málaga']
return
<SevillaMalaga>
  <media_edad>{avg($pacientes/edad)}</media_edad>
  <mayor_edad>{max($pacientes/edad)}</mayor_edad>
  <suma_limitePolizas>{sum($pacientes/limite_poliza)}</suma_limitePolizas>
  <menor_limitePoliza>{min($pacientes/limite_poliza)}</menor_limitePoliza>
</SevillaMalaga>
,

(: Ejercicio 4 :)
(: Obtener de cada provincia la suma del límite de las pólizas de sus pacientes. El listado debe aparecer ordenado alfabeticamente por provincia (A-Z) 
FORMATO:
<provincia nombre='Almería'>15</provincia>
<provincia nombre='Cádiz'>44</provincia>
<provincia nombre='XXXX'>XX</provincia>
...
:)

for $prov in distinct-values(doc("hospital.xml")//provincia)
order by $prov ascending
let $suma := sum(doc("hospital.xml")//paciente[provincia = $prov]/limite_poliza)
return <provincia nombre='{$prov}'>{$suma}</provincia>