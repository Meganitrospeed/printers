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
  %rest:GET
  %rest:path('/printers')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:start(
) as element(html) {
  <html>
<head>
<title>Printers</title>

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"></link>
<script src="/static/js/include.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></link>
   <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
         <link rel="stylesheet" type="text/css" href="/static/css/custom.css"></link>
</head>
<div include="/static/html/header.html"></div>
<body class="cool">
<form action="/printers/printerName" method="POST">
<div class="container">
<div class="row">
<div class="col s6">
<div class="card-panel lighten-5 grey">
<h4>NOMBRE:</h4>
<input class="input-field" type="text" name="name"/>
</div>
<div class="col s6">
<button class="btn waves-effect waves-light red" type="submit">Comparar</button>
</div>
</div>
    </div>
</div>
</form>
<!-- LOL -->

<h1>Añadir:</h1>
<form action="/printers/AddPrinters" method="POST">
<div class="container">
<div class="row ">
<div class="col s6">
<div class="card-panel lighten-5 grey">


NOMBRE:<input type="text" name="name"/>
ID:<input type="number" name="id"/>
<br/>
<br/>
TIPO:<input type="text" name="type"/>
PRECIO:<input type="price" name="price"/>
<br/>
<br/>
</div>
</div>
<div class="col s6">
<button class="btn waves-effect waves-light red" type="submit">Añadir</button>
</div>
</div>
</div>
</form>
<br/>
<br/>
<br/>



<h1>Actualizar:</h1>
<form action="/printers/UpdatePrinters" method="POST">
NOMBRE:<input type="text" name="name"/>
<button type="submit" class="btn btn-primary">Buscar</button>
</form>
<br/>
<br/>
<br/>

<h1>Eliminar:</h1>
<form action="/printers/DeletePrinters" method="POST">
NOMBRE:<input type="text" name="name"/>
<button type="submit" class="btn btn-primary">Buscar</button>
</form>
<!-- LOL -->

<br/>
<br/>
<br/>
<div class="container">
<table class="table">
<thead>
<tr>
<th>Nombre</th>
<th>Tipo</th>
<th>Precio</th>
</tr>
</thead>
<tbody>
{
  for $b in doc("printers")//printer
  order by $b/name
  return <tr>
  <td>{$b/name/text()}</td>
 <td>{$b/type/text()}</td>
  <td>{$b/price/text()}</td>
  </tr>

}
</tbody>
</table>
</div>
</body>
</html>
};