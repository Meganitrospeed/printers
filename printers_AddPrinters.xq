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
  %rest:path('/printers/AddPrinters')
  %rest:form-param("name","{$name}","(no name)")
    %rest:form-param("type","{$type}","(no type)")
      %rest:form-param("id","{$id}","(no id)")
        %rest:form-param("price","{$price}","(no price)")
updating function page:CreateName(
  $name as xs:string,
   $type as xs:string,
   $id as xs:integer,
   $price as xs:float

)

{
  for $add in doc("printers")//printers
  return  insert node
   <printer>
        <id>{$id}</id>
        <name>{$name}</name>
        <type>{$type}</type>
        <price>{$price}</price>
    </printer>
    as first into $add ,
      update:output(web:redirect('/printers'))
};