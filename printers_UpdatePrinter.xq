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
  %rest:path('/printers/UpdatePrinters')
  %rest:form-param("name","{$name}","(no name)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:FindName(
  $name as xs:string
) as element(html) {
  <html>
<head>
<title>PrintersUpdate</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"></link>

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>
<body>

<h1>Actualizar: </h1>
<br/>
<form action="/printers/UpdatePrinter2" method="POST">
NOMBRE:<input type="text" name="name" value='{$name}'/>
ID:<input type="number" name="id"/>
<br/>
<br/>
TIPO:<input type="text" name="type"/>
PRICE:<input type="number" name="price"/>
<br/>
<br/>
<button type="submit" class="btn btn-success">Actualizar</button>
</form>
<br/>
<br/>
<br/>
<table class="table">
<thead>
<tr>
<th>Nombre</th>
<th>Tipo</th>
<th>Fecha</th>
<th>ID</th>
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
  <td>{$b/id/text()}</td>
  </tr>

}
</tbody>
</table>
</body>
</html>
};


(:~
 : Generates a welcome page.
 : @return HTML page
 :)
declare
  %rest:POST
  %rest:path('/printers/UpdatePrinter2')
  %rest:form-param("name","{$name}","(no name)")
      %rest:form-param("type","{$type}","(no type)")
        %rest:form-param("id","{$id}","(no id)")
          %rest:form-param("price","{$price}","(no price)")
updating function page:UpdateName(
  $name as xs:string,
   $type as xs:string,
   $id as xs:integer,
   $price as xs:float

)

{
  for $update in doc("printers")//printer
  where $update/id = $id and $update/name = $name
  return  replace node $update with
    <printer>
        <id>{$id}</id>
        <name>{$name}</name>
        <type>{$type}</type>
        <price>{$price}</price>
    </printer> ,
      update:output(web:redirect('/printers'))
};