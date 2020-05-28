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
<div class="row">
        <form action="/printers/printerName" method="POST">
        <div class="container">
        <div class="col s5">
        <div class="card-panel lighten-5 grey">
            <div class="card-panel grey lighten-3 center">
                <b>Buscar</b>
            </div>
                <div class="row">
                    <div class="input-field col s6">
                       <input id="name" type="text" name="name"/>
                       <label for="name">Nombre</label>
                    </div>
                </div>
        <button class="btn waves-effect waves-light red pulse" type="submit">Comparar</button>
        </div>
        </div>
        </div>
        </form>
        <!-- LOL -->

        <!--WIP WIP WIP WIP WIP WIP -->
        <form action="/printers/AddPrinters" method="POST">
        <div class="container ">
        <div class="col s7 ">
        <div class="card-panel lighten-5 grey">
                <div class="card-panel grey lighten-3 center">
                    <b>Añadir</b>
                </div>
            <div class="col s6">
                    <div class="input-field col s6">
                       <input id="name" type="text" name="name"/>
                       <label for="name">Nombre</label>
                    </div>
                    <div class="input-field col s6">
                       <input type="text" name="id"/>
                       <label for="id">ID</label>
                    </div>
            </div>
            <div class="col s6">
                    <div class="input-field col s6">
                       <input id="type" type="text" name="type"/>
                       <label for="type">TIPO</label>
                    </div>
                    <div class="input-field col s6">
                        <input type="number" name="price"/>
                        <label for="price">PRECIO</label>
                    </div>
            </div>
                     <button class="btn waves-effect waves-light red pulse no-margin" type="submit">Añadir</button>
                     <br/>
                     <br/>
        </div>
        </div>
        </div>
        </form>
        <!--WIP WIP WIP END WIP WIP WIP -->
</div>
<div class="row">
        <form action="/printers/UpdatePrinters" method="POST">
        <div class="container">
        <div class="col s6">
        <div class="card-panel lighten-5 grey">
            <div class="card-panel grey lighten-3 center">
                <b>Actualizar</b>
            </div>
                <div class="row">
                    <div class="input-field col s6">
                       <input id="name" type="text" name="name"/>
                       <label for="name">Nombre</label>
                    </div>
                </div>
        <button type="submit" class="btn waves-effect waves-light red pulse">Buscar</button>
        </div>
        </div>
        </div>
        </form>

        <form action="/printers/DeletePrinters" method="POST">

        <div class="container">
        <div class="col s6">
        <div class="card-panel lighten-5 grey">
            <div class="card-panel grey lighten-3 center">
                <b>Eliminar</b>
            </div>
                <div class="row">
                    <div class="input-field col s6">
                       <input id="name" type="text" name="name"/>
                       <label for="name">Nombre</label>
                    </div>
                </div>
        <button type="submit" class="btn waves-effect waves-light red pulse">Buscar</button>
        </div>
        </div>
        </div>
        </form>
        <!-- LOL -->

        <br/>
        <br/>
        <br/>
        </div>
<div class="container">
    <div class="card-panel grey lighten-3 center">
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
</div>
</body>
</html>
};