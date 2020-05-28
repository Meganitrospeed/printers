(:~
 : This module contains some basic examples for RESTXQ annotations.
 : @author BaseX Team
 :)
module namespace page = 'http://pruebas.com';

(:~
 : Generates a welcome page.
 : @return HTML page
 :)
declare
  %rest:POST
  %rest:path('/printers/printerName')
  %rest:form-param("name","{$name}","(no name)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:FindName(
  $name as xs:string
) as element(html) {
  <html>
<head>
<title>Printers</title>

</head>
<body>
<h1>Busqueda: </h1>
<table class="table">
<thead>
<tr>
<th>Nombre</th>
<th>Tipo</th>
<th>Fecha</th>
</tr>
</thead>
<tbody>
{
  for $b in doc("printers")//printer
  where $b/name/text() = $name
  order by $b/price
  return
   <tr>
  <td>{$b/name/text()}</td>
 <td>{$b/type/text()}</td>
  <td>{$b/price/text()}</td>
  </tr>

}
</tbody>
</table>
</body>
</html>
};