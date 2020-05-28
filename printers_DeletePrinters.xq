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
  %rest:path('/printers/DeletePrinters')
  %rest:form-param("name","{$name}","(no name)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:DeleteName(
  $name as xs:string
) as element(html) {
  <html>
<head>
<title>Printers</title>
<title>Printers</title>

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"></link>

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>
<body>

<h1>Eliminar: </h1>
<br/>
<form action="/printers/DeletePrinters2" method="POST">
NOMBRE:<input type="text" name="name" value='{$name}'/>
ID:<input type="number" name="id"/>
<br/>
<br/>
<button type="submit" class="btn btn-danger">Eliminar</button>
</form>
<br/>
<br/>
<br/>
<table class="table">
<thead>
<tr>
<th>Nombre</th>
<th>Tipo</th>
<th>Precio</th>
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
  %rest:path('/printers/DeletePrinters2')
  %rest:form-param("name","{$name}","(no name)")
        %rest:form-param("id","{$id}","(no id)")
updating function page:DeleteName(
  $name as xs:string,
   $id as xs:integer

)

{
  for $delete in doc("printers")//printer
  where $delete/id = $id and $delete/name = $name
  return  delete node $delete ,
      update:output(web:redirect('/printers'))
};