<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>  
<script>  
var request=new XMLHttpRequest();  
function sourceInfo(){  
var source=document.sourceinfo.source.value;  
var url="demooutput.jsp?val="+source;  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('mysource').innerHTML=val;  
}  
}//end of function  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
</script>  
</head>  
<body>  
<h1>Search Employee</h1>  
<form name="sourceinfo">  
<input type="text" name="source" onkeyup="sourceInfo()">  
</form>  
  
<span id="mysource"></span>  
</body>  
</html>  